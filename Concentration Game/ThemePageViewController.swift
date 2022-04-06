//
//  ThemePageViewController.swift
//  Concentration Game
//
//  Created by user on 16.02.2022.
//

import UIKit

class ThemePageViewController: UIViewController {
    let faces = ["😀","😎","🥲","🥶","🤩","😡","😷","🤯","🥳","🥺","😭","😴","🤔","🤠"]
    let animals = ["🐶","🐱","🐭","🦊","🐻","🐼","🐯","🐸","🐵","🐤","🐮"]
    let technologies = ["🚙","🚌","🚑","🚓","🚜","🚒","🚃","🚀","🛸","🚁","✈️","🛶","🚤","🚛"]
    let fruits = ["🍎","🍊","🍋","🍉","🍇","🍒","🍍","🍌","🫐","🥝","🍓","🥥"]
    let vegetables = ["🍅","🍆","🥑","🥬","🥒","🌶","🌽","🧅","🥕","🍠","🥔"]
    let sports = ["⚽️","🏀","🥎","🏓","🏸","🏒","🥅","⛳️","🤿","🏉","🥊","⛸","🎱"]
    func showTheme (with name:String) -> Array<String>? {
        let all = ["faces": faces,"animals": animals,"technologies": technologies,"fruits": fruits, "vegetables": vegetables, "sports": sports]
        return all[name]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Theme Arrow" {
                if let buttonName = (sender as? UIButton)?.currentTitle, let themeArray = showTheme (with: buttonName) {
                    if let cvc = segue.destination  as? ViewController {
                        cvc.theme = themeArray
                    }
                }
        }
    }
    
}
