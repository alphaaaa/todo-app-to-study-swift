//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/27.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

import UIKit

class TodoTableViewCell : UITableViewCell {
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // タップされた時は何もしない
        self.selectionStyle = .None
        // 背景を白にする
        self.contentView.backgroundColor = UIColor.whiteColor()
        
        // GestureRecognizerの生成と登録
        // 右方向へのスワイプを認識し、スワイプが行われると hideDeleteButton が実行される
        self.contentView.addGestureRecognizer(
            UISwipeGestureRecognizer(target: self, action: "hideDeleteButton")
        )
        // 左方向へのスワイプが行われると showDeleteButton が実行される
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "showDeleteButton")
        swipeRecognizer.direction = .Left
        self.contentView.addGestureRecognizer(swipeRecognizer)
    }
    
}
