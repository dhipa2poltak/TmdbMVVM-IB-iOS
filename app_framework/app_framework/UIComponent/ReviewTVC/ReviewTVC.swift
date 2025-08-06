//
//  ReviewTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Kingfisher
import UIKit
import domain

public class ReviewTVC: UITableViewCell {

    @IBOutlet weak var vwContent: UIView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var ivAuthor: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()

        self.vwContent.layer.borderWidth = 1
        self.vwContent.layer.borderColor = UIColor.lightGray.cgColor
    }

    public func bindData(review: Review) {
        lblContent.text = review.content

        if let avatarPath = review.authorDetails?.avatarPath {
            ivAuthor.kf.setImage(with: URL(string: avatarPath))
        }

        lblAuthor.text = review.author
    }
}
