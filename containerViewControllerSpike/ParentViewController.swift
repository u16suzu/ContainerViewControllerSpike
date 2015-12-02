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
        vc.view.frame.size.height = self.view.frame.size.height - 100
        vc.view.frame.origin.y = 100
        self.view.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    // コンテナビューコントローラから削除
    func removeViewController(vc: UIViewController){
        vc.willMoveToParentViewController(nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
    // アニメーションで遷移する
    func changeWithAnimation(oldVC: UIViewController, newVC: UIViewController) {
        oldVC.willMoveToParentViewController(nil)
        self.addViewController(newVC)
        
        newVC.view.frame = CGRectMake(320, 100, 320, 380)
        let endFrame:CGRect = CGRectMake(-320, 100, 320, 380)
        
        self.transitionFromViewController(oldVC, toViewController: newVC, duration: 0.25, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in

            newVC.view.frame = CGRectMake(0, 100, 320, 380)
           // oldVC.view.frame = endFrame

            }) { (finished) -> Void in
            
            oldVC.removeFromParentViewController()
            newVC.didMoveToParentViewController(self)

        }
    }
}













//



//