//
//  SwiftTestHeader.swift
//  Swift练习
//
//  Created by 赵凯强 on 2019/10/8.
//  Copyright © 2019 ziyouxing. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

// 屏幕的宽
let EPAPPWidth = UIScreen.main.bounds.size.width

// 屏幕的高
let EPAPPHeight = UIScreen.main.bounds.size.height

//判断是否iphoneX系列
func isiPhoneX() ->Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height;

    if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}

//状态栏高度
let STATUSBAR_HEIGHT = isiPhoneX() ? CGFloat(44.0) : CGFloat(20.0)

//导航栏高度:通用
let NAVIGATIONBAR_HEIGHT = UINavigationController().navigationBar.frame.size.height

//顶部高度
let SafeAreaTopHeight = isiPhoneX() ? CGFloat(88.0) : CGFloat(64.0)

//Tabbar高度
let SafeAreaBottomHeight = isiPhoneX() ? CGFloat(83.0) : CGFloat(49.0)

//最底部栏高度
let BottomBar_HEIGHT = isiPhoneX() ? CGFloat(34.0) : CGFloat(0.0)

//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false

//便利化 UserDefaults
let kUserDefaults: UserDefaults = UserDefaults.standard

//便利化 AppDelegate
let kAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

//颜色
func EPColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {

    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)

}

//RGB
func HexRGB(rgbValue: Int, a: CGFloat) -> (UIColor) {

    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,

                  green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,

                  blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,

                  alpha: a)

}

//屏幕适配 直接计算的
func TRUE_(v:CGFloat) -> (CGFloat) {
    
   return ((v)*1.0*(EPAPPWidth)/375)
}

//半粗字体
func EP_FONT_BanCu(font: CGFloat) -> (UIFont) {

    return UIFont.boldSystemFont(ofSize: TRUE_(v: font))

}

//正常字体
func EP_FONT(font: CGFloat) -> (UIFont) {

    return UIFont.systemFont(ofSize: TRUE_(v: font))

}

//系统版本号
let EPAPP_VERSION = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")

//常用颜色
let EPColor_2F2F2F = EPColor(r: 47,g: 47,b: 47)
let EPColor_A3A3A3 = EPColor(r: 163, g: 163, b: 163)
let EPColor_E8E8E8 = EPColor(r: 232, g: 232, b: 232)
let EPColor_000000 = EPColor(r: 0,g: 0,b: 0)
let EPColor_333333 = EPColor(r: 51,g: 51,b: 51)
let EPColor_666666 = EPColor(r: 102,g: 102,b: 102)
let EPColor_999999 = EPColor(r: 153,g: 153,b: 153)
let EPColor_cccccc = EPColor(r: 204,g: 204,b: 204)
let EPColor_efefef = EPColor(r: 239,g: 239,b: 239)
let EPColor_dddddd = EPColor(r: 221,g: 221,b: 221)
let EPColor_blue =   EPColor(r: 154,g: 193,b: 255)
let EPColor_gray =   EPColor(r: 245,g: 245,b: 245)
let EPColor_orange = EPColor(r: 255,g: 167,b: 36)
let EPColor_e5e5e5 = EPColor(r: 229,g: 229,b: 229)
let EPColor_f2f2f2 = EPColor(r: 242,g: 242,b: 242)
let EPColor_red =    EPColor(r: 228,g: 57,b: 60)
let EPColor_f6f6f6 = EPColor(r: 246,g: 246,b: 246)
let EPColor_f7f7f7 = EPColor(r: 247,g: 247,b: 247)

// MARK: - log日志
func DLog<T>( _ message: T, file: String = #file, method: String = #function, line: Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

//MARK: SnapKit
extension ConstraintView {
    
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

extension UICollectionView {
    
    func reloadData(animation: Bool = true) {
        if animation {
            reloadData()
        } else {
            UIView .performWithoutAnimation {
                reloadData()
            }
        }
    }
}
