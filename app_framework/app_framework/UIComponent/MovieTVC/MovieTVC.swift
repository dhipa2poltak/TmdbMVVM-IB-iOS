//
//  MovieTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 23/04/23.
//

import UIKit

public class MovieTVC: UITableViewCell {

    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!

    public func bindData(imageUrl: String?, title: String?, overview: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            ivMovie.kf.setImage(with: URL(string: imageUrl))
        }

        lblTitle.text = title
        lblOverview.text = overview
    }
}
