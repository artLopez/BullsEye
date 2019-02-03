//
//  ViewController.swift
//  BullsEye
//
//  Created by Arturo Lopez on 2/2/19.
//  Copyright © 2019 Arturo Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score: Int = 0
    var round: Int = 0
    var targetValue: Int = 0
    var currentSliderValue : Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentSliderValue = Int(slider.value.rounded())
        startNewRound()
        
    }
    
    @IBAction func showAlert(){
        let points = calculatePoints()
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil )
        
   
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentSliderValue = Int(roundedValue)
    }
    
    @IBAction func resetGame(){
        score = 0;
        round = 0;
        
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 0
        slider.value = Float(currentSliderValue)
        
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        targetLabel.text = String(targetValue)
    }
    
    func calculatePoints() -> Int{
        
        let difference = abs(targetValue - currentSliderValue)
        score += (100 - difference)
        
        return score
    }


}

