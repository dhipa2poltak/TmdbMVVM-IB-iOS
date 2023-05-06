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
import app_framework

class MovieDetailVC: BaseVC<MovieDetailVM>, Storyboarded {

    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!

    var navigationService: NavigationProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()
        // Do any additional setup after loading the view.
        setupObserver()

        viewModel?.fetchMovieDetail(movieId: viewModel?.movieId ?? -1)
    }

    override func setupObserver() {
        super.setupObserver()

        viewModel?.isShowDialogLoading.bind { isShowDialogLoading in
            if isShowDialogLoading {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.titleMovie.bind { [weak self] titleMovie in
            self?.lblTitleMovie.text = titleMovie
        }

        viewModel?.urlImage.bind { [weak self] urlImage in
            if !urlImage.isEmpty {
                self?.ivMovie.kf.setImage(with: URL(string: urlImage))
            }
        }

        viewModel?.descMovie.bind { [weak self] descMovie in
            self?.lblDesc.text = descMovie
        }
    }

    @IBAction func onClickShowReview(_ sender: UIButton) {
        let movieId = viewModel?.movieId ?? -1
        let movieTitle = viewModel?.movieDetailsDomain?.title ?? "unknown"

        navigationService?.showMovieReview(movieId: movieId, movieTitle: movieTitle)
    }

    @IBAction func onClickShowTrailer(_ sender: UIButton) {
        let movieId = viewModel?.movieId ?? -1

        navigationService?.showMovieTrailer(movieId: movieId)
    }
}
