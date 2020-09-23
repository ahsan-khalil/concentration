//
//  GameViewController.swift
//  Concentration
//
//  Created by AhsanKhalil on 23/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var flipCounter = 0 {
        didSet{
            lableFlipCount.text = "Flip : \(flipCounter)"
        }
    }
    public var username:String?
    public var selectedThemeIndex:Int?
    public var selectedTheme:Theme?
    
    
    @IBOutlet weak var lableFlipCount: UILabel!
    @IBOutlet weak var btnEndGame: UIButton!
    
    @IBOutlet var Tiles: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lableFlipCount.backgroundColor = selectedTheme?.tileColor
        btnEndGame.backgroundColor = selectedTheme?.tileColor
        self.view.backgroundColor = selectedTheme?.themeBackground
        for uiButtons in Tiles{
            uiButtons.setTitle(selectedTheme?.Emojies[0], for: .normal)
            uiButtons.backgroundColor = selectedTheme?.tileColor
        }
        
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onClickEndGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTileClick(_ sender: UIButton) {
        
        flipCounter += 1
        
        let selectedTileIndex = Tiles.firstIndex(of:sender)
        print(selectedTileIndex!)
    }
}
