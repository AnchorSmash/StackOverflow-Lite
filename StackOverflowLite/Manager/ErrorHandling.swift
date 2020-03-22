//
//  ErrorHandling.swift
//  StackOverflowLite
//
//  Created by Виктор on 21.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation
import UIKit

class ErrorHandling: NSObject {
    
    var questionsViewController: QuestionsTableViewController?
    
    private func displayErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(acceptAction)
        questionsViewController?.present(alert, animated: true, completion: nil)
    }
    
    func handleError(_ error: ServiceError) {
        switch error {
        case .noInternetConnection:
            displayErrorAlert(with: "Internet connection is lost")
        case .fetchFailed:
            displayErrorAlert(with: "Failed to fetch data")
        case .decodeFailed:
            displayErrorAlert(with: "Failed to decode json")
        case .other:
            displayErrorAlert(with: "Oops! Something went wrong")
        }
    }
}
