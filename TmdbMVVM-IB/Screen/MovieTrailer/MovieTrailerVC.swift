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

    let viewModel = MovieTrailerVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupObserver()
        youtubePlayer.delegate = self
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
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

        viewModel.movieKey.bind { [weak self] value in
            if !value.isEmpty {
                self?.youtubePlayer.loadVideoID(value)
            }

        }
    }

    func playerReady(_ videoPlayer: YouTubePlayerView) {
        youtubePlayer.play()
    }
}
