//
//  ViewController.swift
//  EPARK-Swift
//
//  Created by 赵凯强 on 2019/10/9.
//  Copyright © 2019 EPARKSwift. All rights reserved.
//

import UIKit
import FSPagerView

class HomeViewController: EPBaseViewController {
    
    var headerView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHomePageUI()
        setHomeViewData()
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        EPNavigationPublic.addCentetViewOnNav(self, title: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    // MARK:- SET UI
    
    func setHomePageUI(){
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(EPAPPWidth)
            make.height.equalTo(EPAPPHeight - SafeAreaBottomHeight)
        }
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        
        self.headerView = UIView(frame: CGRect(x: 0, y: 0, width: EPAPPWidth, height: 240))
        self.tableView.tableHeaderView = self.headerView

        self.pagerView.snp.makeConstraints { (make) in
            make.top.left.right.height.equalToSuperview()
        }
        
        self.pageContorl.snp.makeConstraints { (make) in
           make.left.right.equalToSuperview()
           make.height.equalTo(30)
           make.bottom.equalTo(self.pagerView.snp.bottom)
        }
        

    }
    
    func setHomeViewData() {
        let arrM : [String] = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
        for i in 0..<arrM.count {
            self.pageViewImageArray.append(arrM[i])
        }
        self.pageContorl.numberOfPages = self.pageViewImageArray.count
        self.pagerView.reloadData()
    }
    
    
    // MARK:- Lazy load

    lazy var pagerView : FSPagerView = {
        
        let viewPager = FSPagerView()
        self.headerView.addSubview(viewPager)
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        viewPager.itemSize = FSPagerView.automaticSize
        //设置自动翻页事件间隔，默认值为0（不自动翻页）
        viewPager.automaticSlidingInterval = 3.0
        //设置页面之间的间隔距离
        viewPager.interitemSpacing = 0.0
        //设置可以无限翻页，默认值为false，false时从尾部向前滚动到头部再继续循环滚动，true时可以无限滚动
        viewPager.isInfinite = true
        //设置转场的模式
//        viewPager.transformer = FSPagerViewTransformer(type: FSPagerViewTransformerType.depth)
        
        return viewPager
    }()
    lazy var pageContorl:FSPageControl = {
        
        let pageControl = FSPageControl()
        self.headerView.addSubview(pageControl)
        pageControl.contentHorizontalAlignment = .center
        //设置下标指示器颜色（选中状态和普通状态）
        pageControl.setFillColor(.white, for: .normal)
        pageControl.setFillColor(.gray, for: .selected)
        pageControl.setPath(UIBezierPath(ovalIn: CGRect(x: 0, y: -1, width: 8, height: 8)), for: .selected)
        return pageControl
    }()
    
    lazy var tableView : UITableView = {
        
        let table = UITableView()
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        table.backgroundColor = EPColor_f7f7f7
        table.estimatedRowHeight = 0
        table.separatorStyle = .none
        return table
    }()
    
    lazy var pageViewImageArray: [String] = {
        return []
    }()
}

 
extension HomeViewController : FSPagerViewDataSource,FSPagerViewDelegate {
    // MARK:- FSPagerViewDataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.pageViewImageArray.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        //本地
        cell.imageView?.image = UIImage(named: self.pageViewImageArray[index])
        //网络
        // cell.imageView?.kf.setImage(with: URL(string: self.pageViewImageArray[index]))
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    
    // MARK:- FSPagerViewDelegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.selectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageContorl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageContorl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
    
}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    //MARK: UITableViewDataSource
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = EPColor_2F2F2F
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let second = SecondViewController()
        second.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(second, animated: true)
    }
}

