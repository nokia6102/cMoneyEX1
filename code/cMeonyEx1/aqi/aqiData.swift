//
//  aqiData.swift
//  aqi
//
//  Created by Jack on 2018/12/5.
//  Copyright © 2018年 Jack. All rights reserved.
//

import Foundation

let AQI_URL = "https://raw.githubusercontent.com/nokia6102/cMoneyEX1/dbee92324bf985bd865a8a7c8f76c3eae4c02ef7/buy2go.json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

//var buyArray :[Ex1Money]?



struct Ex1Money : Codable {
    
    let productKey : Int?
    let quantiy : Int?
    
    enum CodingKeys: String, CodingKey {
        case productKey = "ProductKey"
        case quantiy = "Quantiy"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productKey = try values.decodeIfPresent(Int.self, forKey: .productKey)
        quantiy = try values.decodeIfPresent(Int.self, forKey: .quantiy)
    }
    
}
