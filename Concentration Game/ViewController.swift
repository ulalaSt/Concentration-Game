//
//  ViewController.swift
//  Concentration Game
//
//  Created by user on 12.02.2022.
//

import UIKit



class ViewController: UIViewController {
    
    
    lazy var collection = Collection.init(HalfNumber: (SetOfButtons.count+1)/2)
    
    @IBOutlet var SetOfButtons: [UIButton]!
    @IBOutlet weak var Score: UILabel!

    
    

    //ВСЕ ДАННЫЕ КНОПОК
    
    
//    var count = 0 {
//        didSet{
//            FlipCount.text = "Flip Count: \(count)"
//        }
//    }
    
    @IBAction func ButtonTouch(_ sender: UIButton) {
//        count+=1
        if let a = SetOfButtons.firstIndex(of: sender){
        collection.ChosenButton(Choose: a)
        ViewModifier()
            Score.text = "Game Score: \(collection.scorePoint)"
        }
    }
    
    
    
    var theme: [String]?{
        didSet {
            images = theme ?? ["3"]
            emojiSet = [:]
            ViewModifier()
        }
    }
    
    //ВСЕ ДАННЫЕ СТИКЕРОВ
    var images: [String]?
//    = StickersSet.themeChoose()

    
    
    
    //КНОПКА РЕСТАРТ...
    @IBOutlet weak var Restart: UIButton!
        
    
    
    @IBAction func RestartAction(_ sender: UIButton) {
        for each in SetOfButtons.indices{
            SetOfButtons[each].backgroundColor = #colorLiteral(red: 0.997739017, green: 0.5840275884, blue: 0, alpha: 1)
            SetOfButtons[each].setTitle("", for: UIControl.State.normal)
            collection.buttons[each].Matched = false
            collection.buttons[each].FaceUp = false
            collection.buttons[each].Opened = false
            collection.scorePoint = 0
            Score.text = "Game Score: \(collection.scorePoint)"
        }
        images = self.theme
        emojiSet.removeAll()
        collection.shuffle()
    }
    
    
    
    
    // ПРИКРЕПЛЯЕТ СМАЙЛИК К emojiset
    var emojiSet = [Button:String]()
  
    func emojiPicker(_ button : Button) -> String {
        if emojiSet[button] == nil, images!.count>0 {
            emojiSet[button] = images!.remove(at: images!.count.randomizer)
        }
        return emojiSet[button] ?? "?"
    }
 
    
    
    
    
    // ПРОВЕРЯЕТ collection И МЕНЯЕТ ВСЕ ЧТО НА ЭКРАНЕ
    func ViewModifier(){
        if SetOfButtons != nil {
        var found = 0
        for each in SetOfButtons.indices{
            let button = collection.buttons[each]
            
            if button.FaceUp == false{
                SetOfButtons[each].setTitle("", for: UIControl.State.normal)
                SetOfButtons[each].backgroundColor = button.Matched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.997739017, green: 0.5840275884, blue: 0, alpha: 1)
            } else {
                SetOfButtons[each].setTitle(emojiPicker(button), for: UIControl.State.normal)
                SetOfButtons[each].backgroundColor = #colorLiteral(red: 0.5571703315, green: 0.5565225482, blue: 0.5783745646, alpha: 1)
            }
            if button.Matched == true{
                found+=1
            }
            
            }
        if found == SetOfButtons.count {
            for each in SetOfButtons.indices{
                SetOfButtons[each].setTitle("", for: UIControl.State.normal)
                SetOfButtons[each].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
            Restart.tintColor = #colorLiteral(red: 0, green: 0.9090073705, blue: 0, alpha: 1)
        }
        }
        
    }
    
}




// extension ДЛЯ int
extension Int {
    var randomizer: Int {
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        return 0
    }
}
