//
//  UTabBarController.swift
//  U17
//
//  Created by charles on 2017/9/29.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class EPTabBarController: UITabBarController {
        
    private var indexFlag : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        /// 首页
        let onePageVC = HomeViewController()
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))
        
        
        /// 空间
        let classVC = SpaceViewController()
        addChildViewController(classVC,
                               title: "空间",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))
        
        
        /// 发现
        let bookVC = DiscoverViewController()
        addChildViewController(bookVC,
                               title: "发现",
                               image: UIImage(named: "tab_book"),
                               selectedImage: UIImage(named: "tab_book_S"))
        
        
        /// 我的
        let mineVC = MyViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(UINavigationController(rootViewController: childController))
    }
    
}

extension EPTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}

extension EPTabBarController : UITableViewDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let index = tabBar.items?.firstIndex(of: item)
    
        if index != self.indexFlag {
          var array : [UIView] = []
          for viewer in self.tabBar.subviews {
          if NSStringFromClass(viewer.classForCoder) == "UITabBarButton"{
                array.append(viewer)
            }
          }
          tabBarAction(arry: array,index: index!)
     }
   }
    
    func tabBarAction(arry:[UIView],index:Int) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.duration = 0.1;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = true;
        animation.fromValue = NSNumber(value: 0.8)   //初始伸缩倍数
        animation.toValue = NSNumber(value: 1.1)    //结束伸缩倍数
        arry[index].layer.add(animation, forKey: nil)
        self.indexFlag = index;
    }
}
