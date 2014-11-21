//
//  TodoDataManager.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/21.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

struct TODO {
    var title : String
}

class TodoDataManager {
    var todoList: [TODO]
    
    // let data = TodoDataManager() で init() が実行される
    init() {
        self.todoList = []
    }
    
    // TODOが正しい書式であるか判定する
    // クラスメソッドとして定義し、クラス名から直接呼び出すのでインスタンスに依存することなく使える
    class func validate(todo: TODO!) -> Bool {
        return todo != nil && todo.title != ""
    }
}