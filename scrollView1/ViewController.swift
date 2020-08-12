//
//  ViewController.swift
//  scrollView1
//
//  Created by user on 2020/8/12.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
// ViewController 遵從 UIScrollViewDelegate protocol
class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //page control 的 property currentPage 代表目前在第幾頁，當它為 0 時，表示在第一頁，第一個小圓點會變色。當它為 1 時，表示在第二頁，第二個小圓點會變色，其它以下類推。
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
// 定義 pageControl 的小圓點 與 scrollView 是相同頁面 currentPage
//scrollView.bounds.width 是 scroll view 的寬度，也是分頁的寬度
//scrollView.contentOffset.x 則是目前滑動的水平距離
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
    }
 //定義 UIScrollViewDelegate 的 viewForZooming(in:)，它將回傳使用者操作縮放手勢時被縮放的 view
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for viewOut in scrollView.subviews {
            if viewOut.isKind(of: UIView.self){
                return viewOut
            }
        }
        return nil
    }
    //更新頁面 ： 連結 page control 的 action function，綁定 value changed event
    @IBAction func changePage(_ sender: UIPageControl) {
        //scrollView.bounds.width 是 scroll view 的寬度，也是分頁的寬度
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        //依據 page control 的 currentPage 計算 scroll view 要移動到的 offset
        scrollView.setContentOffset(point, animated: true)
    }

}

