//
//  EPNavigationPublic.swift
//  U17
//
//  Created by 赵凯强 on 2019/10/12.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class EPNavigationPublic: NSObject {

    //返回按钮
    class func addBackButtonOnTargetNav(_ controller: UIViewController?, action: Selector) {

        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "nav_back_black"), for: .normal)
        button.addTarget(controller, action: action, for: UIControl.Event.touchUpInside)
        button.sizeToFit()
        if (button.bounds.size.width < 40) {
          button.bounds = CGRect(x: 0, y: 0, width: 40, height: 40);
        }
        if (button.bounds.size.height > 40) {
          let height = 40 / button.bounds.size.width * button.bounds.size.height;
          button.bounds = CGRect(x: 0, y: 0, width: 40, height: height);
        }
        let backItem = UIBarButtonItem(customView: button)
        controller?.navigationItem.leftBarButtonItem = backItem
    }
    
    //中间标题
    class func addCentetViewOnNav(_ controller: UIViewController?, title: String){

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        label.text = title
        label.textColor = EPColor_2F2F2F
        label.font = EP_FONT(font: 15)
        label.textAlignment = .center
        label.sizeToFit()
        controller?.navigationItem.titleView = label
    }
    
    //MARK:左侧单个按钮 图标
    class func addLeftButtonWithTarget(_ controller: UIViewController?, action: Selector ,nomalImage:UIImage?) {

        self.setBarButton(controller, action: action, title: nil, nomalImage: nomalImage, higeLightedImage: nil, postion: false)
     }
    
    //MARK:左侧单个按钮 文字
    class func addLeftButtonWithTarget(_ controller: UIViewController?, title:String?, action: Selector) {

          self.setBarButton(controller, action: action, title: title, nomalImage: nil, higeLightedImage: nil, postion: false)
     }

    //MARK:右侧单个按钮 图标
    class func addRightBarButtonWithTarget(_ controller: UIViewController?, action: Selector, nomalImage:UIImage?) {
        
        self.setBarButton(controller, action: action, title: nil, nomalImage: nomalImage, higeLightedImage: nil, postion: true)

    }
    
    //MARK:右侧单个按钮 文字
    class func addRightBarButtonWithTarget(_ controller: UIViewController?, title:String?, action: Selector) {

             self.setBarButton(controller, action: action, title: title, nomalImage: nil, higeLightedImage: nil, postion: true)
    }
    
    //MARK: left传 false right传 true
   class func setBarButton(_ controller: UIViewController?, action: Selector, title:String? ,nomalImage:UIImage? ,higeLightedImage:UIImage?, postion: Bool) {
        
          let button = UIButton(type: .custom)
          if title != nil {
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
          }
          button.addTarget(controller, action: action, for: UIControl.Event.touchUpInside)
          if nomalImage != nil{
             button.setImage(nomalImage, for: .normal)
          }
          if higeLightedImage != nil{
             button.setImage(higeLightedImage, for: .normal)
          }

          setButtonFrame(firstbutton: button, seconButton: nil)
        
          if postion == false {
            button.imageEdgeInsets = .init(top: 0, left: 5 * EPAPPWidth / 375.0, bottom: 0, right: 0)
          }else{
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 5 * EPAPPWidth / 375.0)
          }
          let backItem = UIBarButtonItem(customView: button)
          if postion == false {
            controller?.navigationItem.leftBarButtonItem = backItem
          }else{
            controller?.navigationItem.rightBarButtonItem = backItem
          }
    }
    
    //MARK:两个按钮
    class func addRightTwoBarButtonsWithFirstImage(_ controller: UIViewController?, firstAction: Selector, firsTitle:String? ,firstNomalImage:UIImage? , secondAction:Selector, secondTitle:String? ,secondNormalImage:UIImage?) {
        
          let firstbutton = UIButton(type: .custom)
          let seconButton = UIButton(type: .custom)
        
          if firsTitle != nil {
            firstbutton.setTitle(firsTitle, for: .normal)
            firstbutton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
          }
          if secondTitle != nil {
            seconButton.setTitle(secondTitle, for: .normal)
            seconButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
          }
          firstbutton.addTarget(controller, action: firstAction, for: UIControl.Event.touchUpInside)
          seconButton.addTarget(controller, action: secondAction, for: UIControl.Event.touchUpInside)
          if firstNomalImage != nil{
             firstbutton.setImage(firstNomalImage, for: .normal)
             firstbutton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -15 * EPAPPWidth / 375.0)
          }
          if secondNormalImage != nil{
             seconButton.setImage(secondNormalImage, for: .normal)
             seconButton.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -8 * EPAPPWidth / 375.0)
          }
        
          setButtonFrame(firstbutton: firstbutton ,seconButton:seconButton)

          let cusview = UIView()
          cusview.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
          cusview.addSubview(seconButton)
          cusview.addSubview(firstbutton)
          controller?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cusview)
    }
   
    class private func setButtonFrame(firstbutton:UIButton , seconButton: UIButton?) {
        
        if seconButton != nil {
            
            firstbutton.frame = CGRect(x: 40, y: 0, width: 40, height: 44)
            seconButton!.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
                        
        }else{
            firstbutton.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
        }
    }
}
