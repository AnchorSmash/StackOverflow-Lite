//
//  ImageExtension.swift
//  StackOverflowLite
//
//  Created by Виктор on 20.03.2020.
//  Copyright © 2020 ShadowMoon. All rights reserved.
//

import Foundation
import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(urlString: String) {
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        if let url = URL(string: urlString as String) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
    
    func showUnavailableImage() {
        self.image = UIImage(named: "unavailable")
    }
}

