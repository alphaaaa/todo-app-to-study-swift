//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by usr0600187 on 2014/11/27.
//  Copyright (c) 2014年 ai.tashiro. All rights reserved.
//

import UIKit

class TodoTableViewCell : UITableViewCell {
    // 削除ボタンが表示されている状態かを判定する
    var haveButtonsDisplayd = false
    
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
    
    // 削除ボタンの表示
    func showDeleteButton() {
        if !haveButtonsDisplayd {
            // セルの右側が開くアニメーションを0.1秒間行う
            UIView.animateWithDuration(0.1, animations: {
                let size = self.contentView.frame.size
                let origin = self.contentView.frame.origin
                
                self.contentView.frame = CGRect(x: origin.x - 100, y: origin.y, width: size.width, height: size.height)
            }) {
                // 削除ボタンが開いた状態
                completed in self.haveButtonsDisplayd = true
            }
        }
    }
    
    // 削除ボタンを閉じる
    func hideDeleteButton() {
        if haveButtonsDisplayd {
            UIView.animateWithDuration(0.1, animations: {
                let size = self.contentView.frame.size
                let origin = self.contentView.frame.origin
                
                self.contentView.frame = CGRect(x: origin.x + 100, y: origin.y, width: size.width, height: size.height)
                }) {
                    completed in self.haveButtonsDisplayd = false
            }
        }
    }
    
}
