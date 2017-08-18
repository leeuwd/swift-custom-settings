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

        print("initial night mode setting is: \(UserDefaults.standard.bool(forKey: "nightMode"))")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.detectIfSettingsChanged), name: UserDefaults.didChangeNotification, object: nil)

        //NotificationCenter.defaultCenter.addObserver(self, selector: #selector(self.detectIfSettingsChanged(_:)), name: "Setting", object: nil)

    }


    // MARK: - Functions

    func detectIfSettingsChanged() {

        let nightMode = nightModeIsActive()
        let background = nightMode ? UIColor.black : UIColor.white
        let fontColor = nightMode ? UIColor.white : UIColor.black

        view.backgroundColor = background
        textView.textColor = fontColor
    }

    func nightModeIsActive() -> Bool {
        return UserDefaults.standard.bool(forKey: "nightMode") == true
    }

}
