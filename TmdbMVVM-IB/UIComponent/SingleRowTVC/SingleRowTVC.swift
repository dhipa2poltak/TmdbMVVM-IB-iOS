//
//  GenreTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import UIKit

class SingleRowTVC: UITableViewCell {

    @IBOutlet weak var lblRow: UILabel!

    func bindData(text: String) {
        lblRow.text = text
    }
}
