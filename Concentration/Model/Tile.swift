//
//  Tile.swift
//  Concentration
//
//  Created by AhsanKhalil on 23/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import Foundation

class Tile{
    
    var emoji:String
    var isFlipUP:Bool
    static var indentifier:Int = 0
    var id:Int
    
    
    init(){
        emoji = "🐥"
        isFlipUP = false;
        id = Tile.indentifier
        Tile.indentifier += 1
        
    }
    
    deinit {
        id = -1
    }
}
