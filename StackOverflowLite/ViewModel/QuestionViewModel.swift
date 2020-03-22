//
//  QuestionViewModel.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct QuestionViewModel {
    
    var title: String?
    var displayName: String?
    var profileImage: String?
    var tags: [String]
   
    
    init(question: Item) {
        title = question.title
        displayName = question.owner.displayName
        profileImage = question.owner.profileImage
        tags = question.tags
       
    }
    
}
