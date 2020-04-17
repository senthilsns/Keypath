//
//  ViewController.swift
//  Keypath
//
//  Created by Senthil on 17/04/20.
//  Copyright © 2020 Senthil. All rights reserved.
//

import UIKit

//MARK: Example 1
struct MediField {
    var name : String
    var max : Double
}

//MARK: Example 2
struct Cat {
    
    var name: String
    var favoriteFood: Food
}

struct Food {
    
    var name: String
    var calories: Float
}
//MARK: -----------------

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //MARK: Example 1
        let sample  = MediField(name: "senthil", max: 12.54332)
        let name = sample[keyPath: \MediField.name]

        print(name) // senthil
        
    
        
        //MARK: Example 2
        let foodKeyPath = \Cat.favoriteFood
        let caloryKeyPath = foodKeyPath.appending(path: \Food.calories)

        let footies = Food(name: "Skittles", calories: 999)
        let ani = Cat(name: "Whiskers", favoriteFood: footies)

        let skittlesKcal = ani[keyPath: caloryKeyPath]
        print(skittlesKcal) // 999.0

    }


}

