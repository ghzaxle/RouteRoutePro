//
//  EventListController.swift
//  RouteRoutePro
//
//  Created by 安齋洸也 on 2018/11/09.
//  Copyright © 2018年 安齋洸也. All rights reserved.
//

import Foundation
import UIKit

class EventListController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func selectRouteEvent(_ sender: Any) {
        self.performSegue(withIdentifier: "goRouteEvent", sender: self)
    }
    
    //戻る実装
    @IBAction func myUnwindAction(segue: UIStoryboardSegue) {
    }

}
