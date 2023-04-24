//
//  GenreVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import SVProgressHUD
import UIKit

class GenreVC: BaseVC<GenreVM>, Storyboarded {

    @IBOutlet weak var tableVw: UITableView!

    weak var coordinator: AppCoordinator?

    private let nbName = "GenreTVC"
    private let cellId = "GenreTVC"

    private lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(didRefreshControl), for: .valueChanged)
        return rc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Current configuration: \(BuildConfiguration.shared.environment)")
        print("Base URL: \(BuildConfiguration.shared.API_BASE_URL)")
        setupTableView()
        setupObserver()
    }

    private func setupTableView() {
        if #available(iOS 10.0, *) {
            tableVw.refreshControl = refreshControl
        } else {
            tableVw.addSubview(refreshControl)
        }

        tableVw.dataSource = self
        tableVw.delegate = self
        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .none

        let nibTVC = UINib(nibName: nbName, bundle: nil)
        tableVw.register(nibTVC, forCellReuseIdentifier: cellId)
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

        viewModel?.genreData.bind { [weak self] genreData in
            if let theGenreData = genreData, theGenreData {
                self?.refreshControl.endRefreshing()
                self?.tableVw.reloadData()
                self?.viewModel?.genreData.value = false
            }
        }
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel?.loadData()
    }

    @objc private func didRefreshControl() {
        viewModel?.loadData()
    }
}

extension GenreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.genres?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GenreTVC
        cell.selectionStyle = .none

        if let genre = viewModel?.genres?[indexPath.row] {
            cell.lblGenre.text = genre.name
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = viewModel?.genres?[indexPath.row]
        coordinator?.showMovieByGenre(genreId: genre?.id ?? -1, genreName: genre?.name ?? "unknown")
    }
}
