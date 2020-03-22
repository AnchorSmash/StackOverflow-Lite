//
//  ServiceError.swift
//  StackOverflowLite
//
//  Created by Виктор on 21.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation


public enum ServiceError: Error {
    case noInternetConnection
    case decodeFailed
    case fetchFailed
    case other
}
