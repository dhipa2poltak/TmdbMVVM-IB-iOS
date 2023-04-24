//
//  BaseVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation
import UIKit

class BaseVC<T: BaseVM>: UIViewController {

    var viewModel: T?

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }

    func setupObserver() {
        viewModel?.errorMessage.bind { [weak self] errorMessage in
            if !errorMessage.isEmpty {
                self?.showErrorMessage(errorMessage: errorMessage)
                self?.viewModel?.errorMessage.value = ""
            }
        }
    }

    func setupNavBar(title: String = "TmdbMVVM-IB") {
        guard let navController = navigationController else { return }

        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                           .font: UIFont.preferredFont(forTextStyle: .title1) /* FontFamily.Calibri.bold.font(size: 20) as Any */ ]

        if navController.viewControllers.count > 1 {
            let image = UIImage(named: "ic_back_white")

            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: image,
                style: .plain,
                target: self,
                action: #selector(didTapBack(_:))
            )
        }

        navController.navigationBar.backgroundColor = .white2
        navController.navigationBar.tintColor = .blueAlfa

        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width - 20, height: 30))
        label.text = title
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left

        self.navigationItem.titleView = label
    }

    @objc func didTapBack(_: Any) {
        navigationController?.popViewController(animated: true)
    }

    func showErrorMessage(errorMessage: String) {
        let alert = UIAlertController(title: "Message", message: errorMessage, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
