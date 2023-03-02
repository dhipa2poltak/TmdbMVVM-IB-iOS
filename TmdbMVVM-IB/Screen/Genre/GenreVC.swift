//
//  GenreVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import SVProgressHUD
import UIKit

class GenreVC: BaseVC, Storyboarded {

    @IBOutlet weak var tableVw: UITableView!

    let viewModel = GenreVM()
    weak var coordinator: AppCoordinator?

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

        let nibTVC = UINib(nibName: "SingleRowTVC", bundle: nil)
        tableVw.register(nibTVC, forCellReuseIdentifier: "SingleRowTVC")
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

        viewModel.genreData.bind { [weak self] value in
            if let theValue = value, theValue {
                self?.refreshControl.endRefreshing()
                self?.tableVw.reloadData()
                self?.viewModel.genreData.value = false
            }
        }
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.loadData()
    }

    @objc private func didRefreshControl() {
        viewModel.loadData()
    }
}

extension GenreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.genres?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleRowTVC", for: indexPath) as! SingleRowTVC

        if let genre = viewModel.genres?[indexPath.row] {
            cell.bindData(text: genre.name ?? "")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = viewModel.genres?[indexPath.row]
        coordinator?.showMovieByGenre(genreId: genre?.id ?? -1, genreName: genre?.name ?? "unknown")
    }
}
