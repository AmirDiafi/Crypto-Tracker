//
//  StatisticModel.swift
//  Crypto
//
//  Created by Amir Diafi on 12/12/22.
//

import Foundation

struct StatisticModel: Identifiable {
    var id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }

    
    
}


let test = StatisticModel(title: "", value: "")
