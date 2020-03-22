//
//  Question.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct Item: Codable {
    let tags: [String]
    let owner: Owner
    let isAnswered: Bool?
    let viewCount, answerCount, score, lastActivityDate, creationDate, questionID: Int?
    let link,title: String?
    
    enum CodingKeys: String, CodingKey {
        case tags
        case owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount
        case score
        case lastActivityDate = "last_active_date"
        case creationDate = "creation_date"
        case questionID = "question_id"
        case link, title
    }
    
    
}

struct Owner: Codable {
    let reputation: Int?
    let userID: Int?
    let userType: UserType
    let profileImage: String?
    let displayName: String?
    let link: String?
    
    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
    
}

struct QuestionResponse: Codable {
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

var forQuestion: Item?
let questionID = forQuestion?.questionID
let answerApi = "https://api.stackexchange.com/2.2/questions/\(String(describing: questionID))/answers?order=asc&sort=activity&site=stackoverflow"
