//
//  SecondViewController.swift
//  EPARK-Swift
//
//  Created by 赵凯强 on 2019/10/24.
//  Copyright © 2019 EPARKSwift. All rights reserved.
//

import UIKit

class SecondViewController: EPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        EPNavigationPublic.addCentetViewOnNav(self, title: "详情")
        EPNavigationPublic.addRightBarButtonWithTarget(self, title: "保存", action: #selector(clickc))
    }
    @objc private func clickc() {}
}
