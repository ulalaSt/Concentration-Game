//
//  ButtonData.swift
//  Concentration Game
//
//  Created by user on 12.02.2022.
//

import Foundation
struct Button: Hashable
{
    var hashValue: Int {return Id}
    static func ==(lhs: Button, rhs: Button) -> Bool {
        return lhs.Id == rhs.Id
    }
    
    
    var FaceUp = false
    var Matched = false
    var Opened = false
    private var Id: Int
    
    private static var IdGenerator = 0
    private static func GetId () -> Int {
        IdGenerator+=1
        return IdGenerator 
    }
    
    init() {
        Id = Button.GetId()
    }
    
}
