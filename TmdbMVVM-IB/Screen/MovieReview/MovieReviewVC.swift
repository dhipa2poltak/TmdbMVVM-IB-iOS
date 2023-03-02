//
//  MovieReviewVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import SVProgressHUD
import UIKit

class MovieReviewVC: BaseVC, Storyboarded {

    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var tableVw: UITableView!

    let viewModel = MovieReviewVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitleMovie.text = viewModel.movieTitle

        setupObserver()

        tableVw.delegate = self
        tableVw.dataSource = self

        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .singleLine

        let nibTVC = UINib(nibName: "ReviewTVC", bundle: nil)
        tableVw.register(nibTVC, forCellReuseIdentifier: "ReviewTVC")

        tableVw.reloadData()
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieReviews(movieId: viewModel.movieId, page: viewModel.page)
    }

    private func setupObserver() {
        viewModel.isShowDialogLoading.bind { [weak self] value in
            if value && self?.viewModel.reviews.isEmpty ?? true {
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

        viewModel.reviewData.bind { [weak self] value in
            if value != nil {
                self?.tableVw.reloadData()
                self?.viewModel.reviewData.value = nil
            }
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)

        if distance < 200 {
            viewModel.fetchMovieReviews(movieId: viewModel.movieId, page: viewModel.page + 1)
        }
    }
}

extension MovieReviewVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTVC", for: indexPath) as! ReviewTVC

        let review = viewModel.reviews[indexPath.row]

        cell.bindData(review: review)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
