//
//  Answer.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct AnswerItem: Codable {
    let owner: AnswerOwner
    let isAccepted: Bool?
    let score, lastActivityDate: Int?
    let lastEditDate: Int?
    let creationDate, answerID, questionID: Int?
    let body: String?
    let bodyMarkdown: String?
    
    enum CodingKeys: String, CodingKey {
        case owner
        case isAccepted = "is_accepted"
        case score
        case lastActivityDate = "last_activity_date"
        case lastEditDate = "last_edit_date"
        case creationDate = "creation_date"
        case answerID = "answer_id"
        case questionID = "question_id"
        case body = "body"
        case bodyMarkdown = "body_markdown"
    }
}



struct AnswerOwner: Codable {
    let reputation, userID: Int?
    let userType: UserType
    let acceptRate: Int?
    let profileImage, displayName, link: String?
    
    
    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}

enum UserType: String, Codable {
    case registered = "registered"
    case doesNotExist = "does_not_exist"
    case unregistered = "unregistered"
    case moderator = "moderator"
    case admin = "admin"
}

struct AnswerResponse: Codable {
    let items: [AnswerItem]
 
    enum CodingKeys: String, CodingKey {
        case items 
    }
}
