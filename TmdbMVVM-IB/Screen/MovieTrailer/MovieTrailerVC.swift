//
//  MovieTrailerVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 02/03/23.
//

import Foundation
import SVProgressHUD
import YouTubePlayer

class MovieTrailerVC: BaseVC, Storyboarded, YouTubePlayerDelegate {

    @IBOutlet weak var youtubePlayer: YouTubePlayerView!

    var viewModel: MovieTrailerVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupObserver()
        youtubePlayer.delegate = self
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        if let viewModel = viewModel {
            viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
        }
    }

    private func setupObserver() {
        viewModel?.isShowDialogLoading.bind { isShowDialogLoading in
            if isShowDialogLoading {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.toastMessage.bind { [weak self] toastMessage in
            if !toastMessage.isEmpty {
                self?.showToast(message: toastMessage, font: .systemFont(ofSize: 12.0))
                self?.viewModel?.toastMessage.value = ""
            }
        }

        viewModel?.movieKey.bind { [weak self] movieKey in
            if !movieKey.isEmpty {
                self?.youtubePlayer.loadVideoID(movieKey)
            }

        }
    }

    func playerReady(_ videoPlayer: YouTubePlayerView) {
        youtubePlayer.play()
    }
}
