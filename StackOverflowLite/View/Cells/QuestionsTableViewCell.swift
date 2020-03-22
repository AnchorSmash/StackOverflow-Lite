//
//  QuestionsTableViewCell.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionTagsLabel: UILabel!
    @IBOutlet weak var questionProfilePicImage: UIImageView!
    @IBOutlet weak var questionDisplayNameLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var questionViewModel: QuestionViewModel! {
        didSet {
            questionTitleLabel?.text = questionViewModel.title
            questionDisplayNameLabel?.text = questionViewModel.displayName
            questionTagsLabel?.text = questionViewModel.tags.joined()
            if let profileImage = questionViewModel.profileImage {
                questionProfilePicImage.loadImage(urlString: profileImage)
            } else {
                questionProfilePicImage.showUnavailableImage()
            }
        }
    }
}
