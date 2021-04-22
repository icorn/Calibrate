//
//  PrivacyViewController.swift
//  calibrate
//
//  Created by Oliver Eichhorn on 21.05.18.
//  Copyright © 2018 Oliver Eichhorn. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController
{
    @IBOutlet weak var privacyTextView: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment]
    {
        return [self.privacyTextView]
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        privacyTextView.isSelectable = true
        privacyTextView.isScrollEnabled = true
        privacyTextView.isUserInteractionEnabled = true
        privacyTextView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
        privacyTextView.text = NSLocalizedString("PrivacyStatement", comment: "")
        
        closeButton.setTitle(NSLocalizedString("Close", comment: ""), for: .normal)
        closeButton.addTarget(self, action: #selector(PrivacyViewController.closeButtonTapped(_:)), for: .primaryActionTriggered)
    }
    

    @objc func closeButtonTapped(_ recognizer: UITapGestureRecognizer)
    {
        self.dismiss(animated: true) {}
    }
}
