//
//  Coordinator.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
