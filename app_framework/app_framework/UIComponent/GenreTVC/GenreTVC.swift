//
//  GenreTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 24/04/23.
//

import UIKit

public class GenreTVC: UITableViewCell {


    @IBOutlet weak var vwContent: UIView!
    @IBOutlet weak var lblGenre: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()

        self.vwContent.layer.borderWidth = 1
        self.vwContent.layer.borderColor = UIColor.lightGray.cgColor
    }

    public func bindData(genreName: String?) {
        lblGenre.text = genreName
    }
}
