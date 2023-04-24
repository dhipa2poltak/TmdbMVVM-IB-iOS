//
//  MovieDetailVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import RxSwift

class MovieDetailVM: BaseVM {

    private let getMovieDetailsUseCase: GetMovieDetailsUseCase?
    private let disposeBag = DisposeBag()

    var movieId = -1
    var movieDetailsDomain: MovieDetailsDomain?

    let titleMovie = Box("")
    let urlImage = Box("")
    let descMovie = Box("")

    init(getMovieDetailsUseCase: GetMovieDetailsUseCase?) {
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
    }

    func fetchMovieDetail(movieId: Int) {
        isShowDialogLoading.value = true

        getMovieDetailsUseCase?.call(movieId: movieId)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] domain in
                self?.isShowDialogLoading.value = false
                
                self?.movieDetailsDomain = domain

                self?.titleMovie.value = domain.title
                self?.urlImage.value = domain.imageUrl
                self?.descMovie.value = domain.overview
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.errorMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
