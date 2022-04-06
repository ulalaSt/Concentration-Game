//
//  ButtonCollectionData.swift
//  Concentration Game
//
//  Created by user on 12.02.2022.
//

import Foundation
import UIKit
struct Collection
{
    
    var buttons = [Button]()
    
    
    
    //МЕНЯЕТ ДАННЫЕ КНОПОК
    var idOfOne: Int? {
        get {
            let FaceupCollection = buttons.indices.filter{buttons[$0].FaceUp}
            return FaceupCollection.count == 1 ? FaceupCollection.first : nil
        }
        set {
            for index in buttons.indices{
                buttons[index].FaceUp = (index == newValue)
            }
        }
    }
    var scorePoint = 0
    
    mutating func ChosenButton (Choose Chosen: Int){
        assert(buttons.indices.contains(Chosen), "Error in ButtonCollectionData.ChosenButton. Chosen is: \(Chosen)")
        if !buttons[Chosen].Matched {
            if let a = idOfOne, a != Chosen {
                buttons[Chosen].FaceUp = true
                
                if buttons[Chosen] == buttons[a] {
                    buttons[Chosen].Matched = true
                    buttons[a].Matched = true
                    scorePoint+=2
                } else if buttons[a].Opened == true ||  buttons[Chosen].Opened == true {
                    scorePoint-=1
                }
                buttons[Chosen].Opened = true
                buttons[a].Opened = true
                
            } else {
                
                idOfOne = Chosen
            }
        }
    }
    
    //СОЗДАЁТ ГРУППУ КНОПОК
    mutating func shuffle(){
        buttons.shuffle()
    }
    
    init (HalfNumber: Int){
        assert(HalfNumber>0, "Error in ButtonCollectionData.init. Halfnumber is: \(HalfNumber)")
        for _ in 1...HalfNumber{
            let button = Button()
            buttons+=[button, button]
        }
        shuffle()
    }
}
