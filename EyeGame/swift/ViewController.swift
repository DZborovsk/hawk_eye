//
//  ViewController.swift
//  EyeGame
//
//  Created by Danyil Zborovskyi on 3/4/19.
//  Copyright © 2019 BlueWolf Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var bgTaskLabel: UILabel!
    @IBOutlet weak var bgMinLabel: UILabel!
    @IBOutlet weak var bgMaxLabel: UILabel!
    @IBOutlet weak var bgScoreLabel: UILabel!
    @IBOutlet weak var bgRoundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Entry point for game
        newRound()
        
        //Background labels rounded corners
        self.targetLabel.layer.cornerRadius = 10
        self.scoreLabel.layer.cornerRadius = 10
        self.roundLabel.layer.cornerRadius = 10
        self.bgTaskLabel.layer.cornerRadius = 10
        self.bgMinLabel.layer.cornerRadius = 10
        self.bgMaxLabel.layer.cornerRadius = 10
        self.bgScoreLabel.layer.cornerRadius = 10
        self.bgRoundLabel.layer.cornerRadius = 10
        
        //Slider view set
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //Insets for slider track images
        let slideInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        //Minimum track image for slider
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeble = trackLeftImage.resizableImage(withCapInsets: slideInsets)
        slider.setMinimumTrackImage(trackLeftResizeble, for: .normal)
        
        //Maximum track image for slider
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeble = trackRightImage.resizableImage(withCapInsets: slideInsets)
        slider.setMaximumTrackImage(trackRightResizeble, for: .normal)
        
    }

    //Button hit me hook
    @IBAction func buttonHitMe() {
        //Calculate difference between target value and current value
        let diffValue: Int = abs(currentValue - targetValue)
        //Calculating points
        var points: Int = 100 - diffValue
        let title: String
        
        score += points
        
        //Set different title for popup window and adding bonus points
        if (diffValue == 0) {
            title = "Perfect!"
            points += 100
            score += 100
        } else if (diffValue == 1) {
            title = "So close!"
            points += 50
            score += 50
        } else if (diffValue < 5) {
            title = "Almost there!"
        } else if (diffValue < 10) {
            title = "Nice try!"
        } else {
            title = "Not even close..."
        }
        
        //Set alert window
        let message: String = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.newRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    //Reset all values for new game
    @IBAction func resetButton() {
        score = 0
        round = 0
        newRound()
    }
    
    //Slider hook value
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    //Reset values for new round
    func newRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    //Update values in labels
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

