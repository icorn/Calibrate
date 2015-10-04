//
//  DetailViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 10.09.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	let itemIntroduction 	= 0
	let itemBrightness 		= 10
	let itemContrast 		= 11
	let itemControl 		= 12
	let itemColorSteps		= 13
	let itemSaturation		= 14
	let itemSharpness		= 15
	
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var actionButton: UIButton!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setCurrentItem(NSIndexPath(forRow: 0, inSection: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	func setCurrentItem(newIndexPath: NSIndexPath) {
		let newItemId = newIndexPath.section * 10 + newIndexPath.row
		
		switch newItemId {
			case itemIntroduction:
				headlineLabel.text = "Intro"
			case itemBrightness:
				headlineLabel.text = "Brightness"
			case itemContrast:
				headlineLabel.text = "Contrast"
			case itemControl:
				headlineLabel.text = "Control"
			case itemColorSteps:
				headlineLabel.text = "Colorsteps"
			case itemSaturation:
				headlineLabel.text = "Saturation"
			case itemSharpness:
				headlineLabel.text = "Sharpness"
			
			default: ()
		}
	}

}
