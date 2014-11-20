//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/20.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

import UIKit

class TodoTableViewController : UIViewController {
    // tableViewをプロパティとして宣言
    // この時点では初期値を代入できないので型をOptional型にする
    // こうすることで初期値としてnilが入るようになる
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ヘッダーImageを生成
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        
        // タイトルLabelを生成
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "ToDoリスト"
        // ヘッダーにタイトルを追加
        header.addSubview(title)
        
        // 画面の高さを取得してUITableViewのインスタンスを生成
        let screenWidth = UIScreen.mainScreen().bounds.size.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: 60, width: 320, height: screenWidth - 60))
        
        // ヘッダーを表示
        self.view.addSubview(header)
    }
}
