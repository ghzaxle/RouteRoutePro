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
    
    // sample data
    let eventlist = [
        (eventid: "RR2018111000001", eventtitle:"Happy Cycle!", eventdetail:"the event is happy cycle", ownerid:"k-anzai"),
        (eventid: "RR2018111000002", eventtitle:"Tokyo Cycle!", eventdetail:"the event is cycle in Tokyo", ownerid:"k-anzai"),
        (eventid: "RR2018111000003", eventtitle:"Horiuchi Cycle!", eventdetail:"the event is horiuchi", ownerid:"k-anzai"),
        (eventid: "RR2018111000004", eventtitle:"Happy Cycle!", eventdetail:"the event is happy cycle", ownerid:"k-anzai")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //route event
    @IBAction func selectRouteEvent(_ sender: Any) {
        self.performSegue(withIdentifier: "goRouteEvent", sender: self)
    }
    
    //number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventlist.count
    }
    
    //create cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath)
        let eventData = eventlist[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = eventData.eventtitle
        cell.detailTextLabel?.text = eventData.eventdetail
        return cell
    }
    
    //tap cells
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = eventlist[indexPath.row]
        // ここで管理者か一般ユーザか分岐。今はまだ未実装
        self.performSegue(withIdentifier: "goUserEvent", sender: self)
    }
    
    //data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goUserEvent" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let eventData = eventlist[(indexPath as NSIndexPath).row]
                let nav = segue.destination as! UINavigationController
                let secondView = nav.topViewController as! UserEventController
                secondView.data = eventData
            }
        }
    }
    
    //戻る実装
    @IBAction func myUnwindAction(segue: UIStoryboardSegue) {
    }

}
