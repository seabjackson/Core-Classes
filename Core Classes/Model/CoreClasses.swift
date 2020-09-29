//
//  CoreClasses.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/23/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation

struct Root: Codable {
    let classes: [CoreClasses]
    
    enum CodingKeys: String, CodingKey {
        case classes = "classes"
    }
}

struct CoreClasses : Codable {
    
    let description : String?
    let id : Int?
    let instructor : String?
    let modality : String?
    let time : Int?
    let title : String?
    
    // calculates time in minutes or hours and minutes
    var timeInHoursAndMinutes: String {
        get {
            let mins = time ?? 0
            if mins < Constants.Times.SIXTYMINUTES {
                return String(mins) + "m"
            } else if mins ==  Constants.Times.SIXTYMINUTES  {
                return String(1) + "h" // one hour
            } else if mins > Constants.Times.SIXTYMINUTES {
                return String(mins / Constants.Times.SIXTYMINUTES) + "h" + " " +  String(mins % Constants.Times.SIXTYMINUTES) + "m"
            }
            return ""
        }
    }
    
    var modalityColor: ModalityColors? {
        return ModalityColors(rawValue: modality ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case id = "id"
        case instructor = "instructor"
        case modality = "modality"
        case time = "time"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        instructor = try values.decodeIfPresent(String.self, forKey: .instructor)
        modality = try values.decodeIfPresent(String.self, forKey: .modality)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}
