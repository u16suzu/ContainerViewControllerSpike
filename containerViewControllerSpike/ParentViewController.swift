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
        // 親ビューのボタンを見えるようにしておくために､ 子ビューの高さとy座標を低くしておく
        vc.view.frame = CGRectMake(0, 100, 320, self.view.frame.size.height - 100)
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
        
        // 親ビューのボタンを見えるようにしておくために､ 子ビューの高さとy座標を低くしておく
        let h = self.view.frame.size.height - 100
        
        // new VC の初期位置
        newVC.view.frame = CGRectMake(320, 100, 320, h)        
        // old VC の最終位置
        let endFrame:CGRect = CGRectMake(-320, 100, 320, h)
        
        self.transitionFromViewController(oldVC, toViewController: newVC, duration: 0.25, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in

            // new VC  の最終位置
            newVC.view.frame = CGRectMake(0, 100, 320, h )
            oldVC.view.frame = endFrame

            }) { (finished) -> Void in
            
            oldVC.removeFromParentViewController()
            newVC.didMoveToParentViewController(self)

        }
    }
}













//



//