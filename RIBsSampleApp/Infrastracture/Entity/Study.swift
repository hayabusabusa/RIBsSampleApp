//
//  Study.swift
//  RIBsSampleApp
//
//  Created by Yamada Shunya on 2019/12/18.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import Foundation

struct Study: Codable {
    let id: String // UUID
    let title: String
    let desc: String?
    let date: Date
    let time: Int
}
