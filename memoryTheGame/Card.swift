//
//  Card.swift
//  memoryTheGame
//
//  Created by ViTo on 29/03/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//

import Foundation
import UIKit

class Card {

    var id: Int
    var image: String
    var UIBtn: UIButton!
    
    init(newId id:Int, newImage image:String, newUIBtn UIBtn: UIButton){
        self.id = id
        self.image = image
        self.UIBtn = UIBtn
    }
    
}
