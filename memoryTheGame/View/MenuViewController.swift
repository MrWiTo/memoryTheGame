//
//  MenuController.swift
//  memoryTheGame
//
//  Created by ViTo on 01/04/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//

import Foundation
import UIKit
import WebKit



class MenuViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    @IBAction func SurpriseBtn(_ sender: CircleButton) {
        UIApplication.shared.open(URL(string: "https://drive.google.com/file/d/1KaBdM1Rv65C1i3sN4aTauSjY0jNdc1qI/view?usp=sharing")!)
    }
}
