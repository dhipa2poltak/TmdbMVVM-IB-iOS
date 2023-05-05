//
//  GenreTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 24/04/23.
//

import UIKit

public class GenreTVC: UITableViewCell {

    @IBOutlet weak var lblGenre: UILabel!

    public func bindData(genreName: String?) {
        lblGenre.text = genreName
    }
}
