//
//  ParentViewController.swift
//  containerViewControllerSpike
//
//  Created by u16suzu on 2015/12/02.
//  Copyright © 2015年 IGNIS LTD. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label:UILabel = UILabel.init(frame: CGRectMake(0, 100, 0, 0))
        label.text = self.title
        label.sizeToFit()
        view.addSubview(label)
    }
    
    // コンテナビューコントローラに追加
    func addViewController(vc: UIViewController){
        self.addChildViewController(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    // コンテナビューコントローラから削除
    func removeViewController(vc: UIViewController){
        vc.willMoveToParentViewController(nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
}