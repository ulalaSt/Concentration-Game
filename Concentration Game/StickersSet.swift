//
//  StickersSet.swift
//  Concentration Game
//
//  Created by user on 13.02.2022.
//

import Foundation

class StickersSet {
    static func themeChoose () -> Array<String> {
        let faces = ["😀","😎","🥲","🥶","🤩","😡","😷","🤯","🥳","🥺","😭","😴","🤔","🤠"]
        let animals = ["🐶","🐱","🐭","🦊","🐻","🐼","🐯","🐸","🐵","🐤","🐮"]
        let technologies = ["🚙","🚌","🚑","🚓","🚜","🚒","🚃","🚀","🛸","🚁","✈️","🛶","🚤","🚛"]
        let fruits = ["🍎","🍊","🍋","🍉","🍇","🍒","🍍","🍌","🫐","🥝","🍓","🥥"]
        let vegetables = ["🍅","🍆","🥑","🥬","🥒","🌶","🌽","🧅","🥕","🍠","🥔"]
        let sports = ["⚽️","🏀","🥎","🏓","🏸","🏒","🥅","⛳️","🤿","🏉","🥊","⛸","🎱"]
        
        let all = [faces,animals,technologies,fruits,vegetables,sports]
        
        return all.randomElement()!
    }
}
