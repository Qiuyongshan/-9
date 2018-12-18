//
//  ViewController.swift
//  实验九_(1)_Gesture
//
//  Created by student on 2018/11/11.
//  Copyright © 2018年 QYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from
        
        let addBtn = UIBarButtonItem(title: "添加", style: .plain, target: self, action: #selector(addView))
        let moveBtn = UIBarButtonItem(title: "移动", style: .plain, target: self, action: #selector(moveViews))
        self.navigationItem.rightBarButtonItems = [addBtn, moveBtn]

        let clearBtn = UIBarButtonItem(title: "清空", style: .plain, target: self, action: #selector(clearView))
        self.navigationItem.leftBarButtonItem = clearBtn
    }

    @objc func addView() {
        let maxWidth: CGFloat = 100

        let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
        let point = CGPoint(x: x, y: y)

        let width = CGFloat(arc4random() % UInt32(maxWidth))
        let height = CGFloat(arc4random() % UInt32(maxWidth))
        let size = CGSize(width: width, height: height)

        let view = MyView(frame: CGRect(origin: point, size: size))
        self.view.addSubview(view)
    }
    
    //清除按钮：用户点击这个按钮之后你会将控制器视图上的所有子视图全部移除，使用数组的map方法来移除视图，也可以用循环完成
    @objc func clearView() {
        self.view.subviews.map { $0.removeFromSuperview() }
    }
    
    //随机移动视图
    @objc func moveViews() {
        self.view.subviews.map { (view) in
            let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
            let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
            let point = CGPoint(x: x, y: y)

            UIView.animate(withDuration: 3, animations: {
                view.center = point
            })
        }
    }
}

