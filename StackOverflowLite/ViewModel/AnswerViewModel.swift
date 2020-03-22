//
//  AnswerViewModel.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct AnswerViewModel {
    
    
    var displayName: String?
    var userImage: String?
    var answerID: Int?
    var answerBodyMarkdown: String?
    
    init(answer: AnswerItem) {
        displayName = answer.owner.displayName
        userImage =  answer.owner.profileImage
        answerBodyMarkdown = answer.bodyMarkdown
        answerID = answer.answerID
    
    }
}
