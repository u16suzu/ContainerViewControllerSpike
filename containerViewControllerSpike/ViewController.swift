//
//  ViewController.swift
//  containerViewControllerSpike
//
//  Created by u16suzu on 2015/12/02.
//  Copyright © 2015年 IGNIS LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parentVC = ParentViewController()
        parentVC.view.frame = self.view.frame
        parentVC.title = "parentVC"
        let childVC1 = ChildViewController()
        childVC1.title = "childVC1"
        let childVC2 = ChildViewController()
        childVC2.title = "childVC2"
        let childVC3 = ChildViewController()
        childVC3.title = "childVC3"
        

        parentVC.addViewController(childVC1)
        parentVC.addViewController(childVC2)
        parentVC.addViewController(childVC3)
        
        
        self.view.addSubview(parentVC.view)
    }

}

