//
//  MovieDetailVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import Kingfisher
import SVProgressHUD
import UIKit

class MovieDetailVC: BaseVC, Storyboarded {

    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!

    let viewModel = MovieDetailVM()
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupObserver()
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieDetail(movieId: viewModel.movieId)
    }


    private func setupObserver() {
        viewModel.isShowDialogLoading.bind { value in
            if value {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel.toastMessage.bind { [weak self] value in
            if !value.isEmpty {
                self?.showToast(message: value, font: .systemFont(ofSize: 12.0))
                self?.viewModel.toastMessage.value = ""
            }
        }

        viewModel.titleMovie.bind { [weak self] value in
            self?.lblTitleMovie.text = value
        }

        viewModel.urlImage.bind { [weak self] value in
            self?.ivMovie.kf.setImage(with: URL(string: value))
        }

        viewModel.descMovie.bind { [weak self] value in
            self?.lblDesc.text = value
        }
    }

    @IBAction func onClickShowReview(_ sender: UIButton) {
        let movieId = viewModel.movieId
        let movieTitle = viewModel.movieDetailsResponse?.title ?? "unknown"

        coordinator?.showMovieReview(movieId: movieId, movieTitle: movieTitle)
    }

    @IBAction func onClickShowTrailer(_ sender: UIButton) {
        let movieId = viewModel.movieId

        coordinator?.showMovieTrailer(movieId: movieId)
    }
}
