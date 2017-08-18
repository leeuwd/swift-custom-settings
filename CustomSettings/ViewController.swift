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

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.detectIfSettingsChanged), name: UserDefaults.didChangeNotification, object: nil)
    }


    // MARK: - Functions

    func detectIfSettingsChanged() {
        let nightMode = nightModeIsActive()
        let background = nightMode ? UIColor.black : UIColor.white
        let fontColor = nightMode ? UIColor.white : UIColor.black
        let statusBar = nightMode ? UIStatusBarStyle.lightContent : UIStatusBarStyle.default
        let keyBoard = nightMode ? UIKeyboardAppearance.dark : UIKeyboardAppearance.default

        view.backgroundColor = background
        textView.textColor = fontColor
        textView.keyboardAppearance = keyBoard
        UIApplication.shared.statusBarStyle = statusBar
    }

    func nightModeIsActive() -> Bool {
        return UserDefaults.standard.bool(forKey: "nightMode") == true
    }

}
