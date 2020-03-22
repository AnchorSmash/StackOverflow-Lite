//
//  Profile.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct UserItem: Codable {
    let badgeCounts: ProfileBadgeCounts
    let accountID: Int?
    let isEmployee: Bool?
    let lastModifiedDate: Int?
    let lastAccesDate: Int?
    let reputationChangeYear: Int?
    let reputationChangeQuarter: Int?
    let reputationChangeMonth: Int?
    let reputationChangeWeek: Int?
    let reputationChangeDay: Int?
    let reputation: Int?
    let creationDate: Int?
    let userType: String?
    let userID: Int?
    let acceptRate: Int?
    let location: String?
    let webSiteURL, link, profileImage, displayName: String?
    
    enum CodingKeys: String, CodingKey {
        case badgeCounts
        case accountID = "account_id"
        case isEmployee =  "is_employee"
        case lastModifiedDate = "last_modified_date"
        case lastAccesDate = "last_access_date"
        case reputationChangeYear = "reputation_change_year"
        case reputationChangeQuarter = "reputation_change_quarter"
        case reputationChangeMonth = "reputation_change_month"
        case reputationChangeWeek = "reputation_change_week"
        case reputationChangeDay = "reputation_change_day"
        case reputation = "reputation"
        case creationDate = "creation_date"
        case userType = "user_type"
        case userID = "user_id"
        case acceptRate = "accept_rate"
        case location = "location"
        case webSiteURL = "website_url"
        case link = "link"
        case profileImage = "profile_image"
        case displayName = "display_name"
        
        
        
    }
    
    enum UserType: String, Codable {
        case registered = "registered"
        case doesNotExist = "does_not_exist"
        case unregistered = "unregistered"
        case moderator = "moderator"
        case admin = "admin"
    }
    
}

struct ProfileBadgeCounts: Codable {
    let bronze: Int?
    let silver: Int?
    let gold: Int?
    
    enum CodingKeys: String, CodingKey {
        case bronze = "bronze"
        case silver = "silver"
        case gold = "gold"
        }
}


struct UserResponse: Codable {
    let items: [UserItem]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

var forUsers: UserItem?
let userID = forUsers?.userID
