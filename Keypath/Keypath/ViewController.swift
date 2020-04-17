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
        
        
        //MARK: Example 1 - Keyvalue
        let sample  = MediField(name: "senthil", max: 12.54332)
        let name = sample[keyPath: \MediField.name]

        print(name) // senthil
        
    
        
        //MARK: Example 2 - Keyvalue
        let foodKeyPath = \Cat.favoriteFood
        let caloryKeyPath = foodKeyPath.appending(path: \Food.calories)

        let footies = Food(name: "Skittles", calories: 999)
        let ani = Cat(name: "Whiskers", favoriteFood: footies)

        let skittlesKcal = ani[keyPath: caloryKeyPath]
        print(skittlesKcal) // 999.0
        
        
        //MARK: Example 3 - Callable values
        var steps = StepCounter()
        let  status : Bool  = steps(count:11)
        if (status == true) {
            print("true") // true
        }else {
            print("false")
        }

    }


    //MARK:Example 3 -  Callable values (callAsFunction)
    struct StepCounter {
        var steps = 0

        mutating func callAsFunction(count: Int) -> Bool {
            steps += count
            print(steps)
            return steps > 10
        }
    }
    
    
    
}

