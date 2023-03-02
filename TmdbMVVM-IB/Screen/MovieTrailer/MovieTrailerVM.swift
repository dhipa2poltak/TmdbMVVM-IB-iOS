//
//  MovieTrailerVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 02/03/23.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieTrailerVM: BaseVM {

    var movieId = -1
    let movieKey = Box("")

    func fetchMovieTrailer(movieId: Int) {
        isShowDialogLoading.value = true

        request(Router.fetchMovieTrailer(movieId: movieId))
            .validate()
            .responseJSON { [weak self] response in
                self?.isShowDialogLoading.value = false

                switch response.result {
                case .success:
                    do {
                        let json = JSON(response.value ?? "")
                        let data = try json["results"].rawData(options: .prettyPrinted)

                        let trailers: [Trailer] = try JSONDecoder().decode([Trailer].self, from: data)

                        for trailer in trailers {
                            if trailer.site?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == "youtube" {
                                self?.movieKey.value = trailer.key ?? ""
                                break
                            }
                        }
                    } catch {
                        self?.toastMessage.value = "Error: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self?.toastMessage.value = "Error: \(error.localizedDescription)"
                }
        }
    }
}
