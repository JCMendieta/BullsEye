//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Juan Camilo Mendieta Hernández on 17/01/22.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 0...100)
//        currentValue = 50
        slider.value = Float (currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }

    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(
            title: "Hello, World!",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
}

