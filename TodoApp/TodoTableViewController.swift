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
    
    // ToDo追加アラート
    var alert : UIAlertController?
    
    // TodoDataManagerのインスタンス（シングルトン）
    var todo = TodoDataManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ヘッダーImageを生成
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        // true にすることでheaderにaddSubviewするボタンが正常に動くようにしている
        header.userInteractionEnabled = true
        
        // タイトルLabelを生成
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "ToDoリスト"
        // ヘッダーにタイトルを追加
        header.addSubview(title)

        // ToDo追加ボタンを生成してヘッダーに追加
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRect(x: 320 - 50, y: 20, width: 50, height: 44)
        button.setTitle("追加", forState: .Normal)
        // タップされた時に呼び出すメソッドを指定
        button.addTarget(self, action:"showCreateView", forControlEvents: .TouchUpInside)
        header.addSubview(button)
        
        // 画面の高さを取得してUITableViewのインスタンスを生成
        let screenWidth = UIScreen.mainScreen().bounds.size.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: 60, width: 320, height: screenWidth - 60))
        self.tableView!.dataSource = self
        
        // ヘッダーを表示
        self.view.addSubview(self.tableView!)
        self.view.addSubview(header)
    }
    
    // ToDo追加ボタンがタップされたらアラートを表示する
    func showCreateView() {
        self.alert = UIAlertController(title: "ToDoを追加する", message: nil, preferredStyle: .Alert)
        
        self.alert!.addTextFieldWithConfigurationHandler({
            textField in textField.delegate = self
        })
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
}


extension TodoTableViewController : UITableViewDataSource, UITextFieldDelegate {
    // numberOfRowsInSection で表示するテーブルの行数を返却
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todo.size
    }
    
    // cellForRowAtIndexPath で表示するセルを生成して返却
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel.text = self.todo[row].title
        
        return cell
    }
    
    // UiTextFiledの入力値をもとに新たなToDoを作成し、登録した後にアラートを閉じる
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        let todo = TODO(title: textField.text)
        if self.todo.create(todo) {
            textField.text = nil
            self.tableView!.reloadData()
        }
        
        self.alert!.dismissViewControllerAnimated(false, completion: nil)
        return true
    }
}
