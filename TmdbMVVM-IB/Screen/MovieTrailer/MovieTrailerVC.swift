//
//  MovieTrailerVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 02/03/23.
//

import Foundation
import SVProgressHUD
import YouTubePlayer

class MovieTrailerVC: BaseVC<MovieTrailerVM>, Storyboarded, YouTubePlayerDelegate {

    @IBOutlet weak var youtubePlayer: YouTubePlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupObserver()
        youtubePlayer.delegate = self

        if let viewModel = viewModel {
            viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
        }
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()
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
