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
	let itemBrightness 		= 1
	let itemContrast 		= 2
	let itemOverscan	 	= 3
	let itemSharpness 		= 4
	let itemCombination 	= 5
	
	let testPatterns = [
		"brightness.png",
		"contrast.png",
		"overscan.png",
		"sharpness.png",
		"kombination.png",
	]
	
	var currentItem = 0
	
	let bullet = "\u{25CF}"
	let backViewBottomConstraintName = "BackViewBottom"
	
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var actionButton: UIButton!
	
	@IBOutlet weak var headerLabel1: UILabel!
	
	@IBOutlet weak var bullet1: UILabel!
	@IBOutlet weak var bullet2: UILabel!
	@IBOutlet weak var bullet3: UILabel!
	@IBOutlet weak var bulletLabel1: UILabel!
	@IBOutlet weak var bulletLabel2: UILabel!
	@IBOutlet weak var bulletLabel3: UILabel!
	
	@IBOutlet weak var backView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		actionButton.setTitle(NSLocalizedString("ShowTestPattern", comment: ""), forState: UIControlState.Normal)
		setItem(NSIndexPath(forRow: 0, inSection: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	func setItem(newIndexPath: NSIndexPath) {
		currentItem = newIndexPath.section + newIndexPath.row

		switch currentItem {
			case itemIntroduction:
				setHiddenElements([bullet1, bullet2, bulletLabel1, bulletLabel2], hidden: false)
				setHiddenElements([bullet3, bulletLabel3, actionButton], hidden: true)
				
				headlineLabel.text = " " + NSLocalizedString("Introduction", comment: "") + " "
				headerLabel1.text = NSLocalizedString("introHeader1", comment: "")
				bullet1.text = bullet
				bullet2.text = bullet
				bulletLabel1.text = NSLocalizedString("introBullet1", comment: "")
				bulletLabel2.text = NSLocalizedString("introBullet2", comment: "")
			
				setBottomMostElement(bulletLabel2)
			
			case itemBrightness:
				setHiddenElements([bullet1, bullet2, bulletLabel1, bulletLabel2, actionButton], hidden: false)
				setHiddenElements([bullet3, bulletLabel3], hidden: true)

				headlineLabel.text = " " + NSLocalizedString("Brightness", comment: "") + " "
				headerLabel1.text = NSLocalizedString("brightnessHeader1", comment: "")
				bullet1.text = bullet
				bullet2.text = bullet
				bullet3.text = bullet
				bulletLabel1.text = NSLocalizedString("brightnessBullet1", comment: "")
				bulletLabel2.text = NSLocalizedString("brightnessBullet2", comment: "")
				bulletLabel3.text = NSLocalizedString("brightnessBullet3", comment: "")

				setBottomMostElement(bulletLabel2)

			case itemContrast:
				setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, actionButton], hidden: false)
				
				headlineLabel.text = " " + NSLocalizedString("Contrast", comment: "") + " "
				headerLabel1.text = NSLocalizedString("contrastHeader1", comment: "")
				bullet1.text = bullet
				bullet2.text = bullet
				bullet3.text = bullet
				bulletLabel1.text = NSLocalizedString("contrastBullet1", comment: "")
				bulletLabel2.text = NSLocalizedString("contrastBullet2", comment: "")
				bulletLabel3.text = NSLocalizedString("contrastBullet3", comment: "")
				
				setBottomMostElement(bulletLabel3)
			
			case itemOverscan:
				setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, actionButton], hidden: false)
				
				headlineLabel.text = " " + NSLocalizedString("Overscan", comment: "") + " "
				headerLabel1.text = NSLocalizedString("overscanHeader1", comment: "")
				bullet1.text = bullet
				bullet2.text = bullet
				bullet3.text = bullet
				bulletLabel1.text = NSLocalizedString("overscanBullet1", comment: "")
				bulletLabel2.text = NSLocalizedString("overscanBullet2", comment: "")
				bulletLabel3.text = NSLocalizedString("overscanBullet3", comment: "")
				
				setBottomMostElement(bulletLabel3)
			
			case itemSharpness:
				setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, actionButton], hidden: false)
				
				headlineLabel.text = " " + NSLocalizedString("Sharpness", comment: "") + " "
				headerLabel1.text = NSLocalizedString("sharpnessHeader1", comment: "")
				bullet1.text = bullet
				bullet2.text = bullet
				bullet3.text = bullet
				bulletLabel1.text = NSLocalizedString("sharpnessBullet1", comment: "")
				bulletLabel2.text = NSLocalizedString("sharpnessBullet2", comment: "")
				bulletLabel3.text = NSLocalizedString("sharpnessBullet3", comment: "")
				
				setBottomMostElement(bulletLabel3)
			
			case itemCombination:
				setHiddenElements([actionButton], hidden: false)
				setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3], hidden: true)
				
				headlineLabel.text = " " + NSLocalizedString("Combination", comment: "") + " "
				headerLabel1.text = NSLocalizedString("combinationHeader1", comment: "")
				
				setBottomMostElement(headerLabel1)
			
			default: ()
		}
	}
	
	@IBAction func buttonTapped(sender: AnyObject) {
		
		guard let storyboard = storyboard else { return }
		guard let testPatternViewController = storyboard.instantiateViewControllerWithIdentifier("TestPatternViewController") as? TestPatternViewController else { return }

		if (currentItem <= testPatterns.count) {
			testPatternViewController.imageFile = testPatterns[currentItem-1]
			splitViewController?.presentViewController(testPatternViewController, animated: true, completion: nil)
		}
	}
	
	
	// MARKED: Private Functions
	
	
	private func setHiddenElements(elements: [UIView], hidden: Bool) {
		for element in elements {
			element.hidden = hidden
		}
	}

	
	private func setBottomMostElement(bottomElement: UIView) {

		// remove old backView-bottom-constraing
		
		for constraint in view.constraints {
			if (constraint.identifier == backViewBottomConstraintName) {
				view.removeConstraint(constraint)
			}
		}
		
		// add new constraint
		
		let newConstraint = NSLayoutConstraint(item: bottomElement,	attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: backView,
			attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10)
		
		newConstraint.identifier = backViewBottomConstraintName
		
		view.addConstraint(newConstraint)
	}
}

