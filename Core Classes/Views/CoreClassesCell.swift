//
//  CoreClassesCell.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/24/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import UIKit

class CoreClassesCell: UITableViewCell {
    
    static let reuseIdentifier = "CoreClassesCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureWith(_ coreClass: CoreClasses) {
        timeLabel.text = coreClass.timeInMinutes
//        classTitleLabel.text = coreClass.title ?? ""
//        categoryLabel.text  = coreClass.modality ?? ""
//        instructorLabel.text = coreClass.instructor ?? ""
//        descriptionLabel.text = coreClass.description ?? ""
//        let modality = ModalityColors(rawValue: coreClass.modality ?? "")
//        setColorFor(modality: modality)
    }
    
    private func setColorFor(modality: ModalityColors?) {
        var color: UIColor?
        switch modality {
        case .dance: color = UIColor(hex: Constants.DANCECOLOR)
        case .weights: color = UIColor(hex: Constants.WEIGHTCOLOR)
        case .hiit: color = UIColor(hex: Constants.HIITCOLOR)
        case .yoga: color = UIColor(hex: Constants.YOGACOLOR)
        default:
            break
        }
        categoryLabel.textColor = color
    }
    
}

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
}
