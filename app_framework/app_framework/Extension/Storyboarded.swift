//
//  Storyboarded.swift
//  app_framework
//
//  Created by user on 06/05/23.
//

import Foundation
import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    public static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        return storyboard.instantiateViewController(identifier: className) as! Self
    }
}
