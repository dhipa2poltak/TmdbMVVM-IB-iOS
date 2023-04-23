//
//  ReviewTVC.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import UIKit

class ReviewTVC: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var ivAuthor: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!

    func bindData(review: ReviewEntity) {
        lblContent.text = review.content

        if let avatarPath = review.authorDetails?.avatarPath {
            ivAuthor.kf.setImage(with: URL(string: avatarPath))
        }

        lblAuthor.text = review.author
    }
}
