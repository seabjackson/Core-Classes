//
//  Utils.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/29/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation
import UIKit

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
}
