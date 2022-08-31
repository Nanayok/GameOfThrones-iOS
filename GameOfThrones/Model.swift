//
//  Model.swift
//  GameOfThrones
//
//  Created by Nana Yaw Owusu-Koranteng on 28/08/2022.
//

import Foundation

struct House: Codable, Identifiable {
    
    var id: String { name } // needed for `Identifiable`
    
    let name: String
    let region: String
    let coatOfArms: String
}
