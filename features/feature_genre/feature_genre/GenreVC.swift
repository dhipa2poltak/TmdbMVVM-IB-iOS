//
//  GenreVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import SVProgressHUD
import UIKit
import app_framework

public class GenreVC: BaseVC<GenreVM>, Storyboarded {

    @IBOutlet weak var tableVw: UITableView!

    public var navigationService: NavigationProtocol?

    private let nbName = "GenreTVC"
    private let cellId = "GenreTVC"

    private lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(didRefreshControl), for: .valueChanged)
        return rc
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()

        // Do any additional setup after loading the view.
        print("Current configuration: \(BuildConfiguration.shared.environment)")
        print("Base URL: \(BuildConfiguration.shared.API_BASE_URL)")
        setupTableView()
        setupObserver()

        viewModel?.loadData()
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

        let nibTVC = UINib(nibName: nbName, bundle: Bundle(identifier: "com.dpfht.TmdbMVVM-IB.app-framework"))
        tableVw.register(nibTVC, forCellReuseIdentifier: cellId)
    }

    public override func setupObserver() {
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

    @objc private func didRefreshControl() {
        viewModel?.loadData()
    }
}

extension GenreVC: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.genres?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GenreTVC
        cell.selectionStyle = .none

        if let genre = viewModel?.genres?[indexPath.row] {
            cell.bindData(genreName: genre.name)
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = viewModel?.genres?[indexPath.row]
        navigationService?.showMovieByGenre(genreId: genre?.id ?? -1, genreName: genre?.name ?? "unknown")
    }
}
