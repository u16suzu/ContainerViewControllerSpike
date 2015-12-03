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
        // 簡単化のため iPhone5sの画面サイズのみ考慮する
        let h = self.view.frame.size.height - 100
        

        // newVC, oldVCの開始点､終了点を定義
        // ただ oldVCの 開始点は oldVC自身がすでに保持していて必要ないので定義しない
        let newVCStartFrame = CGRectMake(320, 100, 320, h)
        let newVCEndFrame = CGRectMake(0, 100, 320, h)
        let oldVCEndFrame = CGRectMake(-320, 100, 320, h)
        
        newVC.view.frame = newVCStartFrame
        
        self.transitionFromViewController(oldVC,
            toViewController: newVC,
            duration: 0.25, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                newVC.view.frame = newVCEndFrame
                oldVC.view.frame = oldVCEndFrame
            }) { (finished) -> Void in
                oldVC.removeFromParentViewController()
                newVC.didMoveToParentViewController(self)
        }
    }
}













//



//