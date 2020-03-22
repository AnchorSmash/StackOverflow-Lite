//
//  ProfileViewController.swift
//  StackOverflowLite
//
//  Created by Виктор on 20.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var questionProfileimage: UIImage?
    var questionProfileDisplayName: String?
    
    var userApi = "/2.2/users/\(String(describing: userID))?order=desc&sort=reputation&site=stackoverflow"
    var answerModel: AnswerViewModel?
    var userTask: URLSessionDataTask!
    var errorHandling = ErrorHandling()
     
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userProfileDisplayName: UILabel!
    @IBOutlet weak var userProfileBadgeCounts: UILabel!
    
    var userViewModel: [ProfileViewModel] = [] 
    
    @objc private func loadUsers() {
             userTask?.cancel()
             
             UserClient.sharedInstance.fetchData(urlString: userApi) { [weak self]
                 (userResponse: UserResponse?, error: ServiceError?) in
                 guard let controller = self else { return }
                 
                 DispatchQueue.main.async {
                     if let users = userResponse?.items{
                        controller.userViewModel = users.map({ return ProfileViewModel(profile: $0)})
                     } else if let error = error {
                         controller.errorHandling.handleError(error)
                     }
                 }
             }
         }
    
    override func viewDidAppear(_ animated: Bool) {
        userProfileDisplayName.text = answerModel?.displayName
        if let userImage = answerModel?.userImage {
                           userProfileImage.loadImage(urlString: userImage)
                       } else {
                           userProfileImage.showUnavailableImage()
                       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        userProfileImage.image = questionProfileimage
        userProfileDisplayName.text = questionProfileDisplayName
    }
}

