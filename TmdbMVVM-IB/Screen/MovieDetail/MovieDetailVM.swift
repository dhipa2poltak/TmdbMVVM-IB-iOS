//
//  MovieDetailVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieDetailVM: BaseVM {

    var movieId = -1
    var movieDetailsResponse: MovieDetailsResponse?

    let titleMovie = Box("")
    let urlImage = Box("")
    let descMovie = Box("")

    func fetchMovieDetail(movieId: Int) {
        isShowDialogLoading.value = true

        AF.request(Router.fetchMovieDetail(movieId: movieId))
            .validate()
            .responseJSON { [weak self] response in
                self?.isShowDialogLoading.value = false

                switch response.result {
                case .success:
                    do {
                        let json = JSON(response.value ?? "")
                        let data = try json.rawData(options: .prettyPrinted)

                        let mdResponse = try JSONDecoder().decode(MovieDetailsResponse.self, from: data)
                        self?.movieDetailsResponse = mdResponse

                        self?.titleMovie.value = mdResponse.title ?? ""
                        self?.urlImage.value = BuildConfiguration.shared.IMAGE_URL_BASE_PATH + (mdResponse.posterPath ?? "")
                        self?.descMovie.value = mdResponse.overview ?? ""
                    } catch {
                        self?.toastMessage.value = "Error: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self?.toastMessage.value = "error: \(error.localizedDescription)"
                }
        }
    }
}
