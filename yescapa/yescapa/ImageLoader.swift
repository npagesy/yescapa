//
//  ImageLoader.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

class ImageLoader {
    private var loadedImages = [URL: UIImage]()
    private var runningRequests = [String: URLSessionDataTask]()
    
    func loadImage(id: String, _ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> String? {
        if let image = loadedImages[url] {
            completion(.success(image))
            return nil
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.runningRequests.removeValue(forKey: id) }
            
            if let data = data, let image = UIImage(data: data) {
                self.loadedImages[url] = image
                completion(.success(image))
                return
            }
            
            guard let error = error else { return }
            guard (error as NSError).code == NSURLErrorCancelled else {
                completion(.failure(error))
                return
            }
        }
        task.resume()
        
        runningRequests[id] = task
        return id
    }
    
    func cancelLoad(_ id: String) {
        runningRequests[id]?.cancel()
        runningRequests.removeValue(forKey: id)
    }
}
