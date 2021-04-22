//
//  MenuTableTableViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 10.09.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}



class MenuTableViewController: UITableViewController {
	
	@IBOutlet weak var calibrateNavigationItem: UINavigationItem!
	var detailViewController: DetailViewController?
	
	@IBOutlet weak var tableCellLabelIntro: UILabel!
	@IBOutlet weak var tableCellLabel1: UILabel!
	@IBOutlet weak var tableCellLabel2: UILabel!
	@IBOutlet weak var tableCellLabel3: UILabel!
	@IBOutlet weak var tableCellLabel4: UILabel!
	@IBOutlet weak var tableCellLabel5: UILabel!
    @IBOutlet weak var tableCellLabelInprint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.remembersLastFocusedIndexPath = true
		
		// get detail controller
		
		if splitViewController?.viewControllers.count > 1 {
			detailViewController = splitViewController?.viewControllers[1] as? DetailViewController
		}

		// show nice logo
		
		let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 160))
		let logoImage = UIImage(named: NSLocalizedString("TitleImage", comment: ""))
		
		if let logoImage = logoImage {
			logoImageView.image = logoImage
		}

		calibrateNavigationItem.titleView = logoImageView
		
		// set localized labels
		
		tableCellLabelIntro.text = NSLocalizedString("Introduction", comment: "")
		
		tableCellLabel1.text = "1. " + NSLocalizedString("Brightness", comment: "")
		tableCellLabel2.text = "2. " + NSLocalizedString("Contrast", comment: "")
		tableCellLabel3.text = "3. " + NSLocalizedString("Overscan", comment: "")
		tableCellLabel4.text = "4. " + NSLocalizedString("Sharpness", comment: "")
		tableCellLabel5.text = "5. " + NSLocalizedString("Combination", comment: "")
        
        tableCellLabelInprint.text = NSLocalizedString("ImprintPrivacy", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1
        {
			return NSLocalizedString("Calibration", comment: "")
		}
        else if section == 2
        {
            return NSLocalizedString("Misc", comment: "")
        }

		return ""
	}
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.lightGray
    }
  
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
	override func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)
    {
		// Check that the next focus view is a child of the table view.
		
		guard 	let nextFocusedView = context.nextFocusedView, nextFocusedView.isDescendant(of: tableView),
				let nextFocusedIndexPath = context.nextFocusedIndexPath,
				let	detailViewController = detailViewController else { return }
		
		detailViewController.setItem(nextFocusedIndexPath)
	}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.section == 1)
        {
            detailViewController?.showTestPattern()
        }
        else if (indexPath.section == 2)
        {
            detailViewController?.showPrivacyPolicy()
        }
    }
	
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)
    {
        if let prevFocus = context.previouslyFocusedView as? UITableViewCell
        {
            prevFocus.backgroundColor = UIColor.clear
        }
    }
}
