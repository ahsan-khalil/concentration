//
//  Theme.swift
//  Concentration
//
//  Created by AhsanKhalil on 23/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import Foundation
import UIKit



struct Theme {
    var id:Int
    var Name:String
    var Emojies:[String]
    var themeBackground:UIColor
    var tileColor:UIColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
    
    static var staticIdentifier = 0
    
    init(Name:String,Emojies:[String],themeBackground:UIColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),tileColor:UIColor=#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)){
        id = Theme.staticIdentifier
        Theme.staticIdentifier += 1
        
        self.Name = Name;
        self.Emojies = Emojies
        self.themeBackground = themeBackground
        self.tileColor = tileColor
    }
    
}

class ThemeList{
    static var EmojiLists:[Theme] =
        [
            Theme(Name: "Faces", Emojies: ["😁","😅","😍","😛","🧐","🤨","🤩","🥳","😏","😒","🤓","😜"],themeBackground: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),tileColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
            Theme(Name: "Sports", Emojies: ["⚽️","🏀","🏈","🥎","🎾","🏐","🏉","🎱","🪀","🏓","🏸","🏒"],themeBackground: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1),tileColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
            Theme(Name: "Flags", Emojies: ["🇵🇰","🇦🇫","🇧🇩","🇦🇺","🇮🇳","🇰🇼","🇸🇦","🇸🇽","🇿🇦","🇦🇪","🇺🇸","🏴󠁧󠁢󠁥󠁮󠁧󠁿"],themeBackground: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),tileColor: #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)),
            Theme(Name: "Animals", Emojies: ["🐥","🐶","🐰","🐹","🐭","🐱","🦊","🐻","🐼","🐨","🐯","🦁"],themeBackground: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),tileColor: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
        ]
    
    
    init()
    {
        
        //Color
    }
    
}

