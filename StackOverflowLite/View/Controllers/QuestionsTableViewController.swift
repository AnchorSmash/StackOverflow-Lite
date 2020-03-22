//
//  QuestionsTableViewController.swift
//  StackOverflowLite
//
//  Created by Виктор on 17.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {
     
     
     let questionListApi = "https://api.stackexchange.com//2.2/questions?order=desc&sort=creation&site=stackoverflow"
     var questionTask: URLSessionDataTask!
     var errorHandling = ErrorHandling()
     var detailsVC: QuestionDetialViewControler?
     
    
     
     
    var questionViewModel: [QuestionViewModel] = [] {
         didSet {
             self.tableView.reloadData()         }        
     }
    

     override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
        
     
        
     }
     
     
    @objc private func loadQuestions() {
         questionTask?.cancel()
         
         
         
         ServiceClient.sharedInstance.fetchData(urlString: questionListApi) { [weak self]
             (questionResponse: QuestionResponse?, error: ServiceError?) in
             guard let controller = self else { return }
             
             DispatchQueue.main.async {
                 if let questions = questionResponse?.items {
                     controller.questionViewModel = questions.map({ return QuestionViewModel(question: $0)})
                 } else if let error = error {
                     controller.errorHandling.handleError(error)
                 }
             }
         }
     }

     // MARK: - Table view data source

    
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.questionViewModel.count
     }

     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionsTableViewCell
         let questionViewModel = self.questionViewModel[indexPath.row]
         cell.questionViewModel = questionViewModel

         if (indexPath.row == self.questionViewModel.count - 1) {
             
             self.loadQuestions()
         }
         
         return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if (detailsVC == nil) {
             detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as? QuestionDetialViewControler
         }
         detailsVC?.questionModel = self.questionViewModel[indexPath.row]
         self.navigationController?.pushViewController(detailsVC! , animated: true)
     }

 }
    
    
   
    

