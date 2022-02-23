//
//  AppAppearance.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation
import UIKit

final class AppAppearance {
    static func setupAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        
        var backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold))
        backButtonImage = backButtonImage?.withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -10.0, bottom: 0.0, right: 0.0))
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}
