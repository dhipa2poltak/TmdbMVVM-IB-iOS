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

    func bindData(review: Review) {
        lblContent.text = review.content

        if var avatarPath = review.authorDetails?.avatarPath {
            if avatarPath.starts(with: "/") {
                avatarPath.remove(at: avatarPath.startIndex)
            }

            ivAuthor.kf.setImage(with: URL(string: avatarPath))
        }

        lblAuthor.text = review.author
    }
}
