//
//  MovieReviewVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Alamofire
import Foundation
import SwiftyJSON

class MovieReviewVM: BaseVM {

    var reviews: [Review] = []
    let reviewData: Box<Bool?> = Box(false)

    var movieId = -1
    var movieTitle = ""
    var page = 1

    func fetchMovieReviews(movieId: Int, page: Int) {
        isShowDialogLoading.value = true

        AF.request(Router.fetchMovieReviews(movieId: movieId, page: page))
            .validate()
            .responseJSON { [weak self] response in
                self?.isShowDialogLoading.value = false

                switch response.result {
                case .success:
                    do {
                        let json = JSON(response.value ?? "")
                        let data = try json["results"].rawData(options: .prettyPrinted)

                        let reviews: [Review] = try JSONDecoder().decode([Review].self, from: data)

                        if reviews.count > 0 {
                            for review in reviews {
                                self?.reviews.append(review)
                                self?.reviewData.value = true
                            }

                            self?.page = page
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
