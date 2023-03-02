//
//  MovieByGenreVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieByGenreVM: BaseVM {

    var movies: [Movie] = []
    let movieData: Box<Bool?> = Box(false)

    var genreId = -1
    var genreName = ""
    var page = 1

    func fetchMovieGenre(genreId: String, page: Int) {
        isShowDialogLoading.value = true

        request(Router.fetchMovieByGenre(genreId: genreId, page: page))
            .validate()
            .responseJSON { [weak self] response in
                self?.isShowDialogLoading.value = false

                switch response.result {
                case .success:
                    do {
                        let json = JSON(response.value ?? "")
                        let data = try json["results"].rawData(options: .prettyPrinted)

                        let movies: [Movie] = try JSONDecoder().decode([Movie].self, from: data)

                        if movies.count > 0 {
                            for movie in movies {
                                self?.movies.append(movie)
                                self?.movieData.value = true
                            }

                            self?.page = page
                        }
                    } catch {
                        self?.toastMessage.value = "Error: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self?.toastMessage.value = "error: \(error.localizedDescription)"
                }
        }
    }
}
