//
//  LoginController.swift
//  RouteRoutePro
//
//  Created by 安齋洸也 on 2018/11/09.
//  Copyright © 2018年 安齋洸也. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.password.delegate = self
        self.email.delegate = self
    }

    @IBAction func touchLoginDo(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as!     AppDelegate
        appDelegate.email = "horifuga@yahoo.co.jp"
        
        self.performSegue(withIdentifier: "doLogin", sender: self)
    }
    
    //complete keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    // hide keyboard
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }    
}
