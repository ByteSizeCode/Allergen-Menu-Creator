//
//  Item.swift
//  Alergy Menu
//
//  Created by Isaac Raval on 4/21/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var title: String
    var containsGluten: Bool
    var containsSoy: Bool
    var containsDairy: Bool
    var fullListAllergens: String
    
    init(title: String, containsGluten: Bool, containsSoy: Bool, containsDairy: Bool, fullListAllergens: String) {
        self.title = title
        self.containsGluten = containsGluten
        self.containsSoy = containsSoy
        self.containsDairy = containsDairy
        self.fullListAllergens = fullListAllergens
    }
}
