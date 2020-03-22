//
//  ServiceClient.swift
//  StackOverflowLite
//
//  Created by Виктор on 21.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation

struct ServiceClient {

    static let sharedInstance = ServiceClient()


    public func fetchData(urlString: String, completion: @escaping (QuestionResponse, ServiceError?) -> ()) {
        //let maxPageSize = ServiceClient.maximumPageSize
    
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in

            
            if let err = err {
                print("Failed to fetch data:", err)
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(QuestionResponse.self, from: data)
                //print("QUESTION: \(response)")
                completion(response, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
}

struct AnswerClient {
    
    static let sharedInstance = AnswerClient()

    public func fetchData(urlString: String, completion: @escaping (AnswerResponse, ServiceError?) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in

            if let err = err {
                print("Failed to fetch data:", err)
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let answerResponse = try decoder.decode(AnswerResponse.self, from: data)
                
                completion(answerResponse, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
}

struct UserClient {
    
    static let sharedInstance = UserClient()

    public func fetchData(urlString: String, completion: @escaping (UserResponse, ServiceError?) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in

            if let err = err {
                print("Failed to fetch data:", err)
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(UserResponse.self, from: data)
                
                completion(userResponse, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
}
