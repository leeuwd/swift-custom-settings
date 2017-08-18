//
//  ViewController.swift
//  CustomSettings
//
//  Created by Dick de Leeuw on 18-08-17.
//  Copyright © 2017 Dick de Leeuw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!


    // MARK: - View did load

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()

        print("night mode setting is: \(UserDefaults.standard.bool(forKey: "nightMode"))")
    }

}
