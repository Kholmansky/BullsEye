//
//  ViewController.swift
//  BullsEye
//
//  Created by IOS developer on 24/07/2017.
//
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func showAlert(){
		let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: .alert)
		
		let action = UIAlertAction (title: "Awesome", style: .default)
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
	}


}

