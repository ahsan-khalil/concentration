//
//  Concentration.swift
//  Concentration
//
//  Created by AhsanKhalil on 23/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import Foundation
import UIKit

class Concentration{
    
    private var tiles:[Tile]
    private var activeFlipedTile:Tile? = nil
    private var isActiveFlippedTile = false
    
    
    init(Counter:Int, EmojiList:[String]){
        tiles = [Tile]()
        var newEmojiList:[String] = [String]()
        newEmojiList.append(contentsOf: EmojiList)
        newEmojiList.append(contentsOf: EmojiList)
        newEmojiList.shuffle()
        newEmojiList.shuffle()
        for i in 0..<Counter*2{
            tiles.append(Tile())
            tiles[i].emoji = newEmojiList[i]
        }
    }
    
    public func displayTiles(){
        for tile in tiles{
            print("tile with id= \(tile.id) has emoji = \(tile.emoji)")
        }
    }
    
    
    
    
    
    public func getTile(at index:Int) -> Tile {
        return tiles[index]
    }
    
    public func setEmoji(atTile index:Int,Emoji:String){
        tiles[index].emoji = Emoji
    }
    
    public func getEmoji(atTile index:Int) -> String{
        return tiles[index].emoji
    }
    
    public func  isAlreadyFlipped(atTile index:Int) -> Int{
        return tiles[index].flipCounter
    }
    
    public func getTileId(atTile index:Int) -> Int{
        return tiles[index].id
    }
    
    public func flipTile(atTile index:Int){
        if !(tiles[index].isFlipUP) {
            tiles[index].flipCounter += 1
            if activeFlipedTile == nil{
                activeFlipedTile = tiles[index]
                isActiveFlippedTile = true
            }
        }
        tiles[index].isFlipUP = !(tiles[index].isFlipUP)
    }
    
    public func getActiveFlipedTile()-> Tile? {
        return activeFlipedTile
    }
    
    public func isActiveFlippedCard() -> Bool {
        return isActiveFlippedTile
    }
    
    public func removeActiveFlippedTile() {
        isActiveFlippedTile = false
        activeFlipedTile = nil
    }
    
    public func isFlipTile(atTile index:Int) -> Bool {
        return tiles[index].isFlipUP
    }
    
    public func getTilesCount() -> Int {
        return tiles.count
    }
    
    public func flipBackAll(){
        for i in 0..<tiles.count{
            tiles[i].isFlipUP = false
        }
    }
    
}
