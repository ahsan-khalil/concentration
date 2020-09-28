//
//  GameViewController.swift
//  Concentration
//
//  Created by AhsanKhalil on 23/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import UIKit
import QuartzCore

class GameViewController: UIViewController {

    var flipCounter = 0 {
        didSet{
            lableFlipCount.text = "Flip : \(flipCounter)"
        }
    }
    public var username:String?
    public var selectedThemeIndex:Int?
    public var selectedTheme:Theme?
    public var concentration:Concentration?
    public var flippedButton:UIButton?
    let transparentView = UIView()
    
    @IBOutlet weak var labelGameMode: UILabel!
    @IBOutlet weak var labelPlayerName: UILabel!
    @IBOutlet weak var lableFlipCount: UILabel!
    @IBOutlet weak var btnEndGame: UIButton!
    
    
    @IBOutlet var Tiles: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lableFlipCount.backgroundColor = selectedTheme?.tileColor
        labelGameMode.backgroundColor = selectedTheme?.tileColor
        labelPlayerName.backgroundColor = selectedTheme?.tileColor
        btnEndGame.backgroundColor = selectedTheme?.tileColor
        self.view.backgroundColor = selectedTheme?.themeBackground
        
        labelGameMode.text = "Game Mode: \(selectedTheme?.Emojies[0] ?? "😀")"
        labelPlayerName.text = " Hi, \(username ?? "Ahsan")!"
        
        
        labelPlayerName.layer.cornerRadius = 15
        labelPlayerName.layer.masksToBounds = true
        labelGameMode.layer.cornerRadius = 15
        labelGameMode.layer.masksToBounds = true
        lableFlipCount.layer.cornerRadius = 15
        lableFlipCount.layer.masksToBounds = true
        btnEndGame.layer.cornerRadius = 5
        
        //in case if we have less tiles then available emojies
        let tileCount = 6
        
        var subEmojiArray = [String]()
        for i in 0..<tileCount{
            subEmojiArray.append(selectedTheme?.Emojies[i] ?? "")
        }
        concentration = Concentration(Counter: 6, EmojiList: subEmojiArray)
        
        
        for uiButtons in Tiles{
            uiButtons.setTitle("", for: .normal)
            uiButtons.layer.cornerRadius = 3
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
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
    
    
    /*--- Blur the Front screen ---*/
    func addTransparentView(btn1:UIButton, btn2:UIButton){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        transparentView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 1.0,options: .curveEaseInOut,animations: {
            self.transparentView.alpha = 0.5
            btn1.isHidden = true
            btn2.isHidden = true
        },completion: nil)
    }
    
    @objc func removeTransparentView()
    {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 1.0,options: .curveEaseInOut,animations: {
            self.transparentView.alpha = 0
        },completion: nil)
    }
    
    @IBAction func onTileClick(_ sender: UIButton) {
        
        if let selectedIndex = Tiles.firstIndex(of:sender){
            if(concentration!.isFlipTile(atTile: selectedIndex)){
                //do nothing
                print("Already Flipped")
            } else {
                //first time flipping
                flipCounter += 1
                if let previousFlippedTile = concentration!.getActiveFlipedTile(){
                    print("there is active flipped tile")
                    let currentTile = concentration!.getTile(at: selectedIndex)
                    if currentTile.id == previousFlippedTile.id {
                        //never gonna happen as already made it secure
                        print("same active flipped tile is clicked")
                    }else{
                        print("some different flipped tiles are clicked")
                        //let see what it is
                        
                        concentration!.flipTile(atTile: selectedIndex)
                        
                        
                        sender.setTitle(concentration!.getEmoji(atTile: selectedIndex), for: .normal)
                        sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        
                        
                        
                        //print("Current clicked index: \(currentTile.id)")
                        //print("previous clicked index: \(previousFlippedTile.id)")
                        
                        if(currentTile.emoji == previousFlippedTile.emoji){
                            print("matched: ")
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                
                                self.flippedButton?.isHidden = true
                                sender.isHidden = true
                            }
                            concentration!.flipBackAll()
                            concentration?.removeActiveFlippedTile()
                           
                            
                            
                        }else{
                            //sleep(2)
                            print("not matched: ")
                            concentration!.flipBackAll()
                            concentration?.removeActiveFlippedTile()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                self.flippedButton?.setTitle("", for: .normal)
                                self.flippedButton?.backgroundColor = self.selectedTheme?.tileColor

                                sender.setTitle("", for: .normal)
                                sender.backgroundColor = self.selectedTheme?.tileColor
                                self.flippedButton = sender
                                
                            }
                            
                            
                            
                            

                            //addTransparentViewWithFlip(btn1: flippedButton!, btn2: sender)
                            
                            
                            removeTransparentView()
                            
                        }
                        
                        
                    }
                    
                    //matching process will begin here
                    
                }else{
                    //no need to match just flip it
                    print("there is no active flipped tile")
                    concentration!.flipTile(atTile: selectedIndex)
                    flippedButton = sender
                    
                    sender.setTitle(concentration!.getEmoji(atTile: selectedIndex), for: .normal)
                    sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
            
        }
        else {
            print("Clicked Tile doesn't exists in collection")
        }
           
        
        
        
        
        
        
        
        
        
        
//        if((concentration?.isFlipTile(atTile: selectedTileIndex!))==false){
//            flipCounter += 1
//            print(selectedTileIndex!)
//
//            if let activeFlippedTile = concentration?.getActiveFlipedTile() {
//                print(activeFlippedTile)
//                let selectedTile = concentration?.getTile(at: selectedTileIndex!)
//                //print()
//                if(selectedTile?.id != activeFlippedTile[1]?.id && selectedTile! == activeFlippedTile[0]!){
//                    concentration?.removeActiveFlippedTile()
//                    flippedButton?.isHidden = true
//                    sender.isHidden = true
//
//                }else{
//                    concentration?.flipTile(atTile: selectedTileIndex!)
//                    flippedButton = sender
//                    sender.setTitle(concentration?.getEmoji(atTile: selectedTileIndex!), for: .normal)
//                    sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                }
//            }else{
//                concentration?.flipTile(atTile: selectedTileIndex!)
//                flippedButton = sender
//                sender.setTitle(concentration?.getEmoji(atTile: selectedTileIndex!), for: .normal)
//                sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            }
//
//
//        }else{
//            print(selectedTileIndex!)
//            print("else")
//            sender.setTitle("", for: .normal)
//            sender.backgroundColor = selectedTheme?.tileColor
//        }
        
        
    }
}
