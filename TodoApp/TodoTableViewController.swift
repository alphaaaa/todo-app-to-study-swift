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
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "ToDoリスト"
        header.addSubview(title)
        
        self.view.addSubview(header)
    }
}
