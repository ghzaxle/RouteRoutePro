//
//  SignUpController.swift
//  RouteRoutePro
//
//  Created by 安齋洸也 on 2018/11/09.
//  Copyright © 2018年 安齋洸也. All rights reserved.
//

import Foundation
import UIKit

class SignUpController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.name.delegate = self
        self.email.delegate = self
        self.password.delegate = self
    }
    
    //complete keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    //hide keyborad
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

