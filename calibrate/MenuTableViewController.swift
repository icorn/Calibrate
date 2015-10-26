//
//  MenuTableTableViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 10.09.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit


class MenuTableViewController: UITableViewController {
	
	@IBOutlet weak var calibrateNavigationItem: UINavigationItem!
	var detailViewController: DetailViewController?
	
	@IBOutlet weak var tableCellLabelIntro: UILabel!
	@IBOutlet weak var tableCellLabel1: UILabel!
	@IBOutlet weak var tableCellLabel2: UILabel!
	@IBOutlet weak var tableCellLabel3: UILabel!
	@IBOutlet weak var tableCellLabel4: UILabel!
	@IBOutlet weak var tableCellLabel5: UILabel!
	@IBOutlet weak var tableCellLabel6: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.layoutMargins.left = 90
		tableView.layoutMargins.right = 50
		tableView.remembersLastFocusedIndexPath = true
		
		// get detail controller
		
		if splitViewController?.viewControllers.count > 1 {
			detailViewController = splitViewController?.viewControllers[1] as? DetailViewController
		}

		// show nice logo
		
		let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 102))
		let logoImage = UIImage(named: "CalibrateTitle.png")
		
		if let logoImage = logoImage {
			logoImageView.image = logoImage
		}

		calibrateNavigationItem.titleView = logoImageView
		
		// set localized labels
		
		
		tableCellLabelIntro.text = NSLocalizedString("Introduction", comment: "")
		
		tableCellLabel1.text = "1. " + NSLocalizedString("Brightness", comment: "")
		tableCellLabel2.text = "2. " + NSLocalizedString("Contrast", comment: "")
		tableCellLabel3.text = "3. " + NSLocalizedString("Verification", comment: "")
		tableCellLabel4.text = "4. " + NSLocalizedString("Colorsteps", comment: "")
		tableCellLabel5.text = "5. " + NSLocalizedString("Saturation", comment: "")
		tableCellLabel6.text = "6. " + NSLocalizedString("Sharpness", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return NSLocalizedString("Calibration", comment: "")
		}
		
		return ""
	}
	
	override func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
		
		// Check that the next focus view is a child of the table view.
		
		guard 	let nextFocusedView = context.nextFocusedView where nextFocusedView.isDescendantOfView(tableView),
				let nextFocusedIndexPath = context.nextFocusedIndexPath,
				let	detailViewController = detailViewController else { return }
		
		detailViewController.setItem(nextFocusedIndexPath)
	}
	
}
