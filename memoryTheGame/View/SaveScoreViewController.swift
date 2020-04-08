//
//  SaveScoreViewController.swift
//  memoryTheGame
//
//  Created by ViTo on 01/04/2020.
//  Copyright © 2020 ViTo. All rights reserved.
//

import Foundation
import UIKit

class SaveScoreViewController: UIViewController {
    
    @IBOutlet weak var NickTextField: UITextField!
    @IBAction func SubmitBtn(_ sender: CircleButton) {
        
        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
            myDelegate.addScore(name: NickTextField.text!, points: Int64(finalScore))
        }
        self.view.endEditing(false)
        NickTextField.text = ""
    }
    var finalScore = 0
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print(finalScore)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
