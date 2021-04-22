//
//  TestPatternViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 26.10.15.
//  Copyright © 2015 Oliver Eichhorn. All rights reserved.
//

import UIKit

class TestPatternViewController: UIViewController {

	@IBOutlet var imageButton: UIButton!
	
	var imageFile: String = ""
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		imageButton.setImage(UIImage(named: imageFile), for: UIControl.State())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	@IBAction func buttonPressed(_ sender: AnyObject) {
		self.dismiss(animated: true, completion: nil)
	}
	
}
