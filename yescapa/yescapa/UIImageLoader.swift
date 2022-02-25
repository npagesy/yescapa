//
//  UIImageLoader.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

class UIImageLoader {
    static let loader = UIImageLoader()
    
    private let imageLoader  = ImageLoader()
    private var uuidMap = [UIImageView: String]()
    
    private init() {}
    
    func load(id: String, _ url: URL, for imageView: UIImageView) {
        let token = imageLoader.loadImage(id: id, url) { result in
            defer { self.uuidMap.removeValue(forKey: imageView) }
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } catch {
                print(error)
            }
        }
        
        if let token = token {
            uuidMap[imageView] = token
        }
    }
    
    func cancel(for imageView: UIImageView) {
        if let id = uuidMap[imageView] {
            imageLoader.cancelLoad(id)
            uuidMap.removeValue(forKey: imageView)
        }
    }
}
