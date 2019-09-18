//
//  Fruit.swift
//  Fruit
//
//  Created by Cain Luo on 2019/9/18.
//  Copyright © 2019 Cain Luo. All rights reserved.
//

import Foundation
import UIKit

enum FruitType {
    case apple, banana, blackberry, cherries, coconut, grapes
    
    var image: UIImage {
        switch self {
        case .apple:
            return UIImage(named: "Apple")!
        case .banana:
            return UIImage(named: "Banana")!
        case .blackberry:
            return UIImage(named: "Blackberry")!
        case .cherries:
            return UIImage(named: "Cherries")!
        case .coconut:
            return UIImage(named: "Coconut")!
        case .grapes:
            return UIImage(named: "Grapes")!
        }
    }
}

struct Fruit {
    let name: String
    let description: String
    let iconName: String
    let fruitType: FruitType
    
    init(name: String, description: String, iconName: String, fruitType: FruitType) {
        self.name = name
        self.description = description
        self.iconName = iconName
        self.fruitType = fruitType
    }
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
}
