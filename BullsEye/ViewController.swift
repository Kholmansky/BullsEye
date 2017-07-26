//
//  ViewController.swift
//  BullsEye
//
//  Created by IOS developer on 24/07/2017.
//
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 25
    var targetValue = 0
	var score = 0
	var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
		updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
		let difference = abs(currentValue - targetValue)
		let points = 100 - difference
		score += points
		
		let title : String
		if difference == 0{
			title = "Perfect!"
		} else if difference < 5 {
			title = "You almost had it"
		} else if difference < 10 {
			title = "Pretty good"
		} else {
			title = "No even close..."
		}
		
        let message = "You scored \(points) points"
		
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction (title: "OK", style: .default)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
		updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("value :\(currentValue)")
    }
    
    func startNewRound(){
		round += 1
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
    }
	func updateLabels(){
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}
	
	func startNewGame(){
		score = 0
		round = 0
		startNewRound()
	}
	@IBAction func startOver(){
		startNewGame()
		updateLabels()
	}
	
}

