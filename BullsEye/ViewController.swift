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
    var alertTitle: String?
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
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
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
    
    func calculatePoints() -> Int {
        
        let difference = abs(targetValue - currentSliderValue)
        setAlertTitle(diff: difference)
        
        var roundPoints = (100 - difference) + calculateBonusPoints(diff: difference)
        
        score += roundPoints
        
        return roundPoints
    }
    
    func setAlertTitle(diff: Int)  {
        
        if(diff == 0) {
            alertTitle = "Perfect!"
        } else if(diff < 5){
            alertTitle = "You almost had it!"
        } else if(diff < 10) {
            alertTitle = "Pretty good!"
        } else {
            alertTitle = "Not even close..."
        }
        
    }
    
    func calculateBonusPoints(diff: Int) -> Int {
        if(diff == 0){
            return 100
        } else if(diff == 1) {
            return 50
        }else{
            return 0
        }
    }


}

