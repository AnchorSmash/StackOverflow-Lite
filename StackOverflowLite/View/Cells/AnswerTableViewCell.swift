//
//  AnswersTableViewCell.swift
//  StackOverflowLite
//
//  Created by Виктор on 18.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var answerProfileImage: UIImageView!
    @IBOutlet weak var answerDisplayName: UILabel!
    @IBOutlet weak var answerBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var answerViewModel: AnswerViewModel! {
        didSet {
            answerDisplayName?.text = answerViewModel.displayName
            answerBodyLabel?.text = answerViewModel.answerBodyMarkdown
            if let userImage = answerViewModel.userImage {
                answerProfileImage.loadImage(urlString: userImage)
            } else {
                answerProfileImage.showUnavailableImage()
            }
            
        }
    }
}


