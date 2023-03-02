//
//  MovieByGenreVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import SVProgressHUD
import UIKit

class MovieByGenreVC: BaseVC, Storyboarded {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableVw: UITableView!

    let viewModel = MovieByGenreVM()
    weak var coordinator: AppCoordinator?

    private let nbName = "SingleRowTVC"
    private let cellId = "SingleRowTVC"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if !viewModel.genreName.isEmpty {
            lblTitle.text = "Genre \(viewModel.genreName) Movies"
        }

        setupObserver()

        tableVw.delegate = self
        tableVw.dataSource = self

        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .none

        let nibTVC = UINib(nibName: nbName, bundle: nil)
        tableVw.register(nibTVC, forCellReuseIdentifier: cellId)
        
        tableVw.reloadData()
    }

    private func setupObserver() {
        viewModel.isShowDialogLoading.bind { [weak self] value in
            if value && self?.viewModel.movies.isEmpty ?? true {
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

        viewModel.movieData.bind { [weak self] value in
            if let theValue = value, theValue {
                self?.tableVw.reloadData()
                self?.viewModel.movieData.value = nil
            }
        }
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: viewModel.page)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        
        if distance < 200 {
            viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: viewModel.page + 1)
        }
    }
}

extension MovieByGenreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SingleRowTVC

        let movie = viewModel.movies[indexPath.row]

        cell.bindData(text: movie.title ?? "")

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        coordinator?.showMovieDetail(movieId: movie.id ?? -1)
    }
}
