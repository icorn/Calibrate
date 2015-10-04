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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	override func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
		
		// Check that the next focus view is a child of the table view.
		
		guard 	let nextFocusedView = context.nextFocusedView where nextFocusedView.isDescendantOfView(tableView),
				let nextFocusedIndexPath = context.nextFocusedIndexPath,
				let	detailViewController = detailViewController else { return }
		
		detailViewController.setCurrentItem(nextFocusedIndexPath)
	}
	
}
