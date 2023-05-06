//
//  MovieByGenreVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import SVProgressHUD
import UIKit
import app_framework

class MovieByGenreVC: BaseVC<MovieByGenreVM>, Storyboarded {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableVw: UITableView!

    var navigationService: NavigationProtocol?

    private let nbName = "MovieTVC"
    private let cellId = "MovieTVC"

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()
        // Do any additional setup after loading the view.

        if !(viewModel?.genreName.isEmpty ?? true) {
            lblTitle.text = String(format: NSLocalizedString("key_title_movies_in_genre", comment: ""), viewModel?.genreName ?? "unknown")
        }

        setupObserver()

        tableVw.delegate = self
        tableVw.dataSource = self
        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .none

        let nibTVC = UINib(nibName: nbName, bundle: Bundle(identifier: "com.dpfht.TmdbMVVM-IB.app-framework"))
        tableVw.register(nibTVC, forCellReuseIdentifier: cellId)
        
        tableVw.reloadData()

        if let viewModel = viewModel {
            viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: viewModel.page)
        }
    }

    override func setupObserver() {
        super.setupObserver()

        viewModel?.isShowDialogLoading.bind { [weak self] isShowDialogLoading in
            if isShowDialogLoading && self?.viewModel?.movies.isEmpty ?? true {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.movieData.bind { [weak self] movieData in
            if let theMovieData = movieData, theMovieData {
                self?.tableVw.reloadData()
                self?.viewModel?.movieData.value = nil
            }
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        
        if distance < 200, let viewModel = viewModel {
            viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: (viewModel.page) + 1)
        }
    }
}

extension MovieByGenreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTVC
        cell.selectionStyle = .none

        let movie = viewModel?.movies[indexPath.row]
        cell.bindData(imageUrl: movie?.imageUrl, title: movie?.title, overview: movie?.overview)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel?.movies[indexPath.row]
        navigationService?.showMovieDetail(movieId: movie?.id ?? -1)
    }
}
