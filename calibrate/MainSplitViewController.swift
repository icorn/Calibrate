//
//  MainSplitViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 10.09.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit

class MainSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		// set width of master view (table menu)
		maximumPrimaryColumnWidth = 500
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
