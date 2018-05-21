//
//  DetailViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 10.09.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	let itemBrightness 		= 0
	let itemContrast 		= 1
	let itemOverscan	 	= 2
	let itemSharpness 		= 3
	let itemCombination 	= 4
	
	let testPatterns = [
		"brightness.png",
		"contrast.png",
		"overscan.png",
		"sharpness.png",
		"kombination.png",
	]
	
	var currentItem = 0
	
    let bullet = "\u{2022}"
	let backViewBottomConstraintName = "BackViewBottom"
	
	@IBOutlet weak var headlineLabel: UILabel!
	
	@IBOutlet weak var headerLabel1: UILabel!
	
	@IBOutlet weak var bullet1: UILabel!
	@IBOutlet weak var bullet2: UILabel!
	@IBOutlet weak var bullet3: UILabel!
	@IBOutlet weak var bulletLabel1: UILabel!
	@IBOutlet weak var bulletLabel2: UILabel!
	@IBOutlet weak var bulletLabel3: UILabel!
	@IBOutlet weak var backView: UIView!
    @IBOutlet weak var pressRemoteLabel: UILabel!
    
    @IBOutlet weak var headlineTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pressRemoteLabel.text = "   " + NSLocalizedString("PressRemoteButton", comment: "") + "   "
        
        // if tvOS 10, move the headline 30 pixels up
        if let version = Double(UIDevice.current.systemVersion), version < 11.0
        {
            headlineTopConstraint.constant += 30
        }
        
        setItem(IndexPath(row: 0, section: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	func setItem(_ newIndexPath: IndexPath)
    {
		if (newIndexPath.section == 0)
        {
            setHiddenElements([bullet1, bullet2, bulletLabel1, bulletLabel2], hidden: false)
            setHiddenElements([bullet3, bulletLabel3, pressRemoteLabel], hidden: true)
            
            headlineLabel.text = " " + NSLocalizedString("Introduction", comment: "") + " "
            headerLabel1.text = NSLocalizedString("introHeader1", comment: "")
            bullet1.text = bullet
            bullet2.text = bullet
            bulletLabel1.text = NSLocalizedString("introBullet1", comment: "")
            bulletLabel2.text = NSLocalizedString("introBullet2", comment: "")
            pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

            setBottomMostElement(bulletLabel2)
        }
        else if (newIndexPath.section == 1)
        {
            self.currentItem = newIndexPath.row
            
            switch newIndexPath.row {
                case itemBrightness:
                    setHiddenElements([bullet1, bullet2, bulletLabel1, bulletLabel2, pressRemoteLabel], hidden: false)
                    setHiddenElements([bullet3, bulletLabel3], hidden: true)

                    headlineLabel.text = " " + NSLocalizedString("Brightness", comment: "") + " "
                    headerLabel1.text = NSLocalizedString("brightnessHeader1", comment: "")
                    bullet1.text = bullet
                    bullet2.text = bullet
                    bullet3.text = bullet
                    bulletLabel1.text = NSLocalizedString("brightnessBullet1", comment: "")
                    bulletLabel2.text = NSLocalizedString("brightnessBullet2", comment: "")
                    bulletLabel3.text = NSLocalizedString("brightnessBullet3", comment: "")
                    pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

                    setBottomMostElement(bulletLabel2)

                case itemContrast:
                    setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, pressRemoteLabel], hidden: false)
                    
                    headlineLabel.text = " " + NSLocalizedString("Contrast", comment: "") + " "
                    headerLabel1.text = NSLocalizedString("contrastHeader1", comment: "")
                    bullet1.text = bullet
                    bullet2.text = bullet
                    bullet3.text = bullet
                    bulletLabel1.text = NSLocalizedString("contrastBullet1", comment: "")
                    bulletLabel2.text = NSLocalizedString("contrastBullet2", comment: "")
                    bulletLabel3.text = NSLocalizedString("contrastBullet3", comment: "")
                    pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

                    setBottomMostElement(bulletLabel3)
                
                case itemOverscan:
                    setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, pressRemoteLabel], hidden: false)
                    
                    headlineLabel.text = " " + NSLocalizedString("Overscan", comment: "") + " "
                    headerLabel1.text = NSLocalizedString("overscanHeader1", comment: "")
                    bullet1.text = bullet
                    bullet2.text = bullet
                    bullet3.text = bullet
                    bulletLabel1.text = NSLocalizedString("overscanBullet1", comment: "")
                    bulletLabel2.text = NSLocalizedString("overscanBullet2", comment: "")
                    bulletLabel3.text = NSLocalizedString("overscanBullet3", comment: "")
                    pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

                    setBottomMostElement(bulletLabel3)
                
                case itemSharpness:
                    setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3, pressRemoteLabel], hidden: false)
                    
                    headlineLabel.text = " " + NSLocalizedString("Sharpness", comment: "") + " "
                    headerLabel1.text = NSLocalizedString("sharpnessHeader1", comment: "")
                    bullet1.text = bullet
                    bullet2.text = bullet
                    bullet3.text = bullet
                    bulletLabel1.text = NSLocalizedString("sharpnessBullet1", comment: "")
                    bulletLabel2.text = NSLocalizedString("sharpnessBullet2", comment: "")
                    bulletLabel3.text = NSLocalizedString("sharpnessBullet3", comment: "")
                    pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

                    setBottomMostElement(bulletLabel3)
                
                case itemCombination:
                    setHiddenElements([pressRemoteLabel], hidden: false)
                    setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3], hidden: true)
                    
                    headlineLabel.text = " " + NSLocalizedString("Combination", comment: "") + " "
                    headerLabel1.text = NSLocalizedString("combinationHeader1", comment: "")
                    pressRemoteLabel.text = NSLocalizedString("PressRemoteButton", comment: "")

                    setBottomMostElement(headerLabel1)
                
                default: ()
            }
        }
        if (newIndexPath.section == 2)
        {
            setHiddenElements([pressRemoteLabel], hidden: false)
            setHiddenElements([bullet1, bullet2, bullet3, bulletLabel1, bulletLabel2, bulletLabel3], hidden: true)
            
            headlineLabel.text = " " + NSLocalizedString("Imprint", comment: "") + " "
            headerLabel1.text = NSLocalizedString("ImprintText", comment: "")
            pressRemoteLabel.text = NSLocalizedString("PressRemoteButtonPrivacy", comment: "")
            
            setBottomMostElement(headerLabel1)
        }
	}
	

    func showTestPattern()
    {
        guard let storyboard = storyboard else { return }
        guard let testPatternViewController = storyboard.instantiateViewController(withIdentifier: "TestPatternViewController") as? TestPatternViewController else { return }
        
        if ((currentItem < testPatterns.count) && (currentItem >= 0)) {
            testPatternViewController.imageFile = testPatterns[currentItem]
            splitViewController?.present(testPatternViewController, animated: true, completion: nil)
        }
    }
	
    func showPrivacyPolicy()
    {
        guard let storyboard = storyboard else { return }
        guard let acceptPrivacyViewController = storyboard.instantiateViewController(withIdentifier: "PrivacyViewController") as? PrivacyViewController else { return }
        splitViewController?.present(acceptPrivacyViewController, animated: true, completion: nil)
    }
    
	// MARKED: Private Functions
	
	
	fileprivate func setHiddenElements(_ elements: [UIView], hidden: Bool) {
		for element in elements {
			element.isHidden = hidden
		}
	}

	
	fileprivate func setBottomMostElement(_ bottomElement: UIView) {

		// remove old backView-bottom-constraing
		
		for constraint in view.constraints {
			if (constraint.identifier == backViewBottomConstraintName) {
				view.removeConstraint(constraint)
			}
		}
		
		// add new constraint
		
		let newConstraint = NSLayoutConstraint(item: bottomElement,	attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: backView,
			attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -10)
		
		newConstraint.identifier = backViewBottomConstraintName
		
		view.addConstraint(newConstraint)
	}
}

