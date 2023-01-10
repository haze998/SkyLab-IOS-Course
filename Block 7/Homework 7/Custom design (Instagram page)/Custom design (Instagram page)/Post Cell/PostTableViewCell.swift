//
//  PostTableViewCell.swift
//  Custom design (Instagram page)
//
//  Created by Evgeniy Docenko on 18.12.2022.
//


import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var viewsCounterLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var commentsCounterLabel: UILabel!
    @IBOutlet weak var timePostedLabel: UILabel!
    
    func configure(with post: Post) {
        // create bold style "namelabel" on description
        let boldText = (post.userName) + " "
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let atributedString = NSMutableAttributedString(string: boldText, attributes: attrs)
        
        // create description text
        let normalText = post.description
        let normalString = NSMutableAttributedString(string: normalText)
        atributedString.append(normalString)
        
        avatarImageView.image = UIImage(named: post.avatarImageName)
        nickNameLabel.text = post.userName
        postImageView.image = UIImage(named: post.postImageName)
        viewsCounterLabel.text = "\(post.viewsCount) views"
        postDescriptionLabel.attributedText = atributedString
        commentsCounterLabel.text = "View all \(post.countOfComments) comments"
        timePostedLabel.text = post.postedAt
    }
}
