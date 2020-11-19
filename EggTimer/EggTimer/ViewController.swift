//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    
    let eggTime = ["Soft": 3, "Medium": 8, "Hard": 12]
    var secondsRemaning = 60
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let results = sender.currentTitle!
        
        secondsRemaning = eggTime[results]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsRemaning > 0{
            secondsLabel.text = "\(secondsRemaning) seconds."
            secondsRemaning -= 1
        }else {
            timer.invalidate()
            secondsLabel.text = "Done!"
        }
    }
    
}
