//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Juan Camilo Mendieta Hernández on 17/01/22.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel : UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var roundLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(
            named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
            withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
            withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 0...100)
        currentValue = 50
        slider.value = Float (currentValue)
        updateLabels()
    }
    
    @IBAction func startOver(){
        round = 0
        score = 0
        startNewRound()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    

    @IBAction func showAlert(){
        
        let difference = abs (currentValue - targetValue)
        var points = 100 - difference
        
        let title : String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            if(difference == 1){
                points += 50
            }
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default) { _ in
            // trailing closure (ultimo parametro es un closure, puedo omitir el nombre)
            // handler: Que ocurre cuando oprimo el botón
            self.startNewRound()
            }
        
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    

}

