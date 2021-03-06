//
//  TodoDataManager.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/21.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

import UIKit

struct TODO {
    var title : String
}

class TodoDataManager {
    let STORE_KEY = "TodoDataManager.store_key"
    
    var todoList: [TODO]
    
    // Computed Property
    // そのプロパティに値を代入する時と値を取り出すときに実行される処理
    // 下記のようにget,set節が両方省略されている場合は get の処理となる
    var size : Int {
        return todoList.count
    }
    
    // シングルトン
    class var sharedInstance : TodoDataManager {
        struct Static {
            static let instance : TodoDataManager = TodoDataManager()
        }
        return Static.instance
    }
    
    // TodoDataManagerに[]を使ってアクセスされた時の振る舞い
    // subscriptを実装していればどんなクラスや構造体であっても[]による振る舞いを追加することができる
    subscript(index: Int) -> TODO {
        return todoList[index]
    }
    
    // let data = TodoDataManager() で init() が実行される
    // NSUserDefaultsからデータを読み出す
    // NSUserDefaultsはplistという形式を使ってアプリ内にデータを保存する
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.objectForKey(self.STORE_KEY) as? [String] {
            self.todoList = data.map {
                title in
                TODO(title: title)
            }
        } else {
            self.todoList = []
        }
    }
    
    // ToDoデータを保存する
    func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let data = self.todoList.map {
            todo in
            todo.title
        }
        defaults.setObject(data, forKey: self.STORE_KEY)
    }
    
    // ToDoが正しい書式であるか判定する
    // クラスメソッドとして定義し、クラス名から直接呼び出すのでインスタンスに依存することなく使える
    class func validate(todo: TODO!) -> Bool {
        return todo != nil && todo.title != ""
    }
    
    // ToDoリストの内容を生成
    func create(todo: TODO!) -> Bool {
        if TodoDataManager.validate(todo) {
            self.todoList.append(todo)
            return true
        }
        return false
    }
    
    // ToDoリストの内容を更新
    func update(todo: TODO!, at index: Int) -> Bool {
        if index >= self.todoList.count {
            return false
        }
        
        if TodoDataManager.validate(todo) {
            todoList[index] = todo
            self.save()
            return true;
        }
        
        return false
    }
    
    // ToDoリストの内容を削除
    func remove(index: Int) -> Bool {
        if index >= self.todoList.count {
            return false
        }
        
        self.todoList.removeAtIndex(index)
        self.save()
        
        return true
    }
}