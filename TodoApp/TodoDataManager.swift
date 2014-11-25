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
    
    var size : Int {
        return todoList.count
    }
    
    // let data = TodoDataManager() で init() が実行される
    init() {
        self.todoList = []
    }
    
    // TODOが正しい書式であるか判定する
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