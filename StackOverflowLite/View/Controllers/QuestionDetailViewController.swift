//
//  QuestionDetailViewController.swift
//  StackOverflowLite
//
//  Created by Виктор on 18.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import UIKit

class QuestionDetialViewControler: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var answersTableView: UITableView!    
    
    let AnswerTableViewCell = "answerCell"
    var questionModel: QuestionViewModel?
    var answerTask: URLSessionDataTask!
    var errorHandling = ErrorHandling()
    var profileVC: ProfileViewController?
    
    @IBOutlet weak var questionDetailProfileImage: UIImageView!
    @IBOutlet weak var questionDetailDisplayNameLabel: UILabel!
    @IBOutlet weak var questionDetailTitleLabel: UILabel!
    @IBOutlet weak var questionDetailTagsLabel: UILabel!
    @IBOutlet weak var questionDetailTextView: UITextView!
    
    var answerViewModel: [AnswerViewModel] = [] {
            didSet {
                self.answersTableView.reloadData()
            }
        }
        
        @objc private func loadAnswers() {
            answerTask?.cancel()
            
            AnswerClient.sharedInstance.fetchData(urlString: answerApi) { [weak self]
                (answerResponse: AnswerResponse?, error: ServiceError?) in
                guard let controller = self else { return }
                
                DispatchQueue.main.async {
                    if let answers = answerResponse?.items{
                        controller.answerViewModel = answers.map({ return AnswerViewModel(answer: $0)})
                    } else if let error = error {
                        controller.errorHandling.handleError(error)
                    }
                }
            }
        }
        
            override func viewDidAppear(_ animated: Bool) {
                questionDetailTitleLabel.text = questionModel?.title
                questionDetailDisplayNameLabel.text = questionModel?.displayName
                questionDetailTagsLabel.text = questionModel?.tags.joined()
                questionDetailTextView.text = questionModel?.answerBodyMarkdown
                if let profileImage = questionModel?.profileImage {
                    questionDetailProfileImage.loadImage(urlString: profileImage)
                } else {
                    questionDetailProfileImage.showUnavailableImage()
                }
        
            }
        
            override func viewDidLoad() {
                super.viewDidLoad()
                answersTableView.rowHeight = UITableView.automaticDimension
                answersTableView.estimatedRowHeight = 127
                
                loadAnswers()
            }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.answerViewModel.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell, for: indexPath) as! AnswerTableViewCell
            let answerViewModel = self.answerViewModel[indexPath.row]
            cell.answerViewModel = answerViewModel
            
            return cell
        }

         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if (profileVC == nil) {
                profileVC = self.storyboard?.instantiateViewController(withIdentifier: "profile") as? ProfileViewController
            }
            profileVC?.answerModel = self.answerViewModel[indexPath.row]
            self.navigationController?.pushViewController(profileVC! , animated: true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToShowProfile" else { return }
        guard let destination = segue.destination as? ProfileViewController else { return }
        
        destination.questionProfileimage = questionDetailProfileImage?.image
        destination.questionProfileDisplayName = questionDetailDisplayNameLabel?.text

    }
}



