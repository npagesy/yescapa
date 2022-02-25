//
//  UIImageView+extension.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(with id: String, at url: URL) {
        UIImageLoader.loader.load(id: id, url, for: self)
    }
    
    func cancelImageLoad() {
        UIImageLoader.loader.cancel(for: self)
    }
}
