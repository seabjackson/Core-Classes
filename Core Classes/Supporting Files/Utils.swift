//
//  Utils.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/29/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation
import UIKit

/// UIColor  extension to convert from hex string to UIColor
extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
}

/// Used for any viewControllers to present an activity indicator when loading data
public protocol ActivityIndicatorLoading {
    
    /// activity indicator
    var activityIndicator: UIActivityIndicatorView { get }
    
    /// show the activity indicator
    func showActivityIndicator()
    
    /// hide activity indicator
    func hideActivityIndicator()
}

public extension ActivityIndicatorLoading where Self: UIViewController {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.style = .large
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: Constants.SIZE.activityIndicatorWidth, height: Constants.SIZE.activityIndicatorWidth)
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}


enum ModalityColors: String {
    case weights = "Weights"
    case hiit = "HIIT"
    case dance = "Dance"
    case yoga = "Yoga"
}


struct Constants {
    static let WEIGHTCOLOR = "#49A3AA"
    static let HIITCOLOR = "#AB3D6E"
    static let DANCECOLOR = "#F09466"
    static let YOGACOLOR = "#1B488C"
    
    struct Theme {
        static let mainColor = "#fef9ec"
    }
    
    struct Titles {
        static let HomeScreenTitle = "Classes"
    }
    
    struct Times {
        static let SIXTYMINUTES = 60
    }
    
    struct URL {
        static let scheme = "https"
        static let host = "core-class-search.herokuapp.com"
        static let path = "/classes"
        
        static let invalidURL = "The URL has Invalid Components: "
    }
    
    struct SIZE {
        static let screenHeight = UIScreen.main.bounds.height
        static let activityIndicatorHeight: CGFloat = 80.0
        static let activityIndicatorWidth: CGFloat = 80.0
        static let tableViewRowHeight: CGFloat = 100.0
    }
}
