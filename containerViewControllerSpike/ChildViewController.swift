//
//  ChildViewController.swift
//  containerViewControllerSpike
//
//  Created by u16suzu on 2015/12/02.
//  Copyright © 2015年 IGNIS LTD. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let label:UILabel = UILabel.init(frame: CGRectMake(0, 100, 0, 0))
        label.text = self.title
        label.sizeToFit()
        view.addSubview(label)
    }
}
