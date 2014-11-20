//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/20.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

import UIKit

class TodoTableViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "ToDoリスト"
        self.view.addSubview(title)
    }
}
