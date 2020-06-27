//
//  STSceneVC.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/27/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import UIKit


let allColors = ["red","green","blue"]

class STSceneVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
         var colorChoices = [String]()
         
         for _ in 1...3{
             colorChoices.append(allColors[Int.random(in: 0...2)])
         }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
