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
        timeLabel.text = coreClass.timeInHoursAndMinutes
        categoryLabel.text  = coreClass.modality ?? ""
        setColorFor(modality: coreClass.modalityColor)
        classTitleLabel.text = coreClass.title ?? ""
        instructorLabel.text = coreClass.instructor ?? ""
        descriptionLabel.text = coreClass.description ?? "No description yet for this activity" // assumption on if no description available
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

