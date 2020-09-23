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
}

struct CoreClasses: Codable {
    let description: String?
    let id: Int
    let instructor: String?
    let modality: String?
    let time: Int?
    let title: String?
}
