//
//  ProfileViewModel.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct ProfileViewModel {
    
    var profileImage: String?
    var displayName: String?
    var badgeCounts: ProfileBadgeCounts
    
    init(profile: UserItem) {
        profileImage = profile.profileImage
        displayName = profile.displayName
        badgeCounts = profile.badgeCounts
    }
}

