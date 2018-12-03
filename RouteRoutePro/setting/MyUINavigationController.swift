//
//  MyUINavigationController.swift
//  RouteRoutePro
//
//  Created by 安齋洸也 on 2018/12/03.
//  Copyright © 2018 安齋洸也. All rights reserved.
//

import Foundation
import UIKit

class MyUINavigationController: UINavigationController{

    // background color setting
    override func viewDidLoad() {
        super.viewDidLoad()
        //　ナビゲーションバーの背景色
        //0.529,0.809,0.922
        navigationBar.barTintColor = UIColor(displayP3Red: 0.529, green: 0.809, blue: 0.922, alpha: 1.0)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        // Do any additional setup after loading the view.
    }
    
}
