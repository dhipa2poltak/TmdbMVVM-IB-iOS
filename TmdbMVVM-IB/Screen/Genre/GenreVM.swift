//
//  GenreVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Alamofire
import Foundation
import SwiftyJSON

class GenreVM: BaseVM {

    var genres: [Genre]?
    let genreData: Box<Bool?> = Box(false)

    func loadData() {
        fetchMovieGenre()
    }

    func fetchMovieGenre() {
        isShowDialogLoading.value = true
        request(Router.fetchMovieGenre)
            .validate()
            .responseJSON { [weak self] response in
                self?.isShowDialogLoading.value = false

                switch response.result {
                case .success:
                    do {
                        let json = JSON(response.value ?? "")
                        let data = try json["genres"].rawData(options: .prettyPrinted)

                        let genres: [Genre] = try JSONDecoder().decode([Genre].self, from: data)
                        self?.genres = genres
                        self?.genreData.value = true
                    } catch {
                        self?.toastMessage.value = "Error: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self?.toastMessage.value = "error: \(error.localizedDescription)"
                }

        }
    }
}
