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
    
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ coreClass: CoreClasses) {
        classTitleLabel.text = coreClass.title ?? ""
        categoryLabel.text  = coreClass.modality ?? ""
        instructorLabel.text = coreClass.instructor ?? ""
    }

}
