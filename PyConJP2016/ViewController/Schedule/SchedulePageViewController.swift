//
//  SchedulePageViewController.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 2016/03/07.
//  Copyright © 2016年 Yutaro Muta. All rights reserved.
//

import UIKit

class SchedulePageViewController: UIPageViewController, SchedulePageViewProtocol {

    var childrenViewControllers: Array<ScheduleListViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        
        let startingViewController: ScheduleListViewController = self.scheduleModelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
        self.dataSource = self.scheduleModelController
        
    }
    
    var _scheduleModelController: ScheduleModelController? = nil
    
    var scheduleModelController: ScheduleModelController{
        if _scheduleModelController == nil {
            _scheduleModelController = ScheduleModelController()
        }
        return _scheduleModelController!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        let scheduleBaseViewController = parent as! ScheduleBaseViewController
        self.delegate = scheduleBaseViewController
        scheduleBaseViewController.schedulePageViewProtocol = self
        
        self.view.subviews.forEach {
            if let scrollView = $0 as? UIScrollView {
                scrollView.delegate = scheduleBaseViewController
            }
        }
    }
    
    // MARK: - SchedulePageViewProtocol
    
    func fowardPage(index: Int) {
        self.movePage(index, direction: .Forward)
    }
    
    func reversePage(index: Int) {
        self.movePage(index, direction: .Reverse)
    }
    
    private func movePage(index: Int, direction: UIPageViewControllerNavigationDirection) {
        let viewController: ScheduleListViewController = scheduleModelController.viewControllerAtIndex(index, storyboard: self.storyboard!)!
        let viewControllers = [viewController]
        self.setViewControllers(viewControllers, direction: direction, animated: true, completion: {done in})
    }
}