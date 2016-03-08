//
//  ScheduleDateViewController.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 2016/03/07.
//  Copyright © 2016年 Yutaro Muta. All rights reserved.
//

import UIKit

class ScheduleDateViewController: UIViewController {

    @IBOutlet weak var activeBarView: UIView!
    @IBOutlet weak var day1Button: UIButton!
    @IBOutlet weak var day2Button: UIButton!
    
    var activeBar = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.mainScreen().bounds.width / 2, height: 3)))
    var buttonOriginXArray: [CGFloat] = []
    
    var movePage: ((index: Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeBar.backgroundColor = UIColor.redColor()
        activeBarView.addSubview(activeBar)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if (buttonOriginXArray.count == 0) {
            self.createButtonOriginXArray()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        let scheduleBaseViewController = parent as! ScheduleBaseViewController
        movePage = scheduleBaseViewController.movePage
        scheduleBaseViewController.addObserver(self, forKeyPath: "offsetToChange", options: [.New, .Old], context: nil)
        scheduleBaseViewController.addObserver(self, forKeyPath: "displayIndex", options: [.New, .Old], context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        switch keyPath! {
//        case "offsetToChange":
//            if let offsetToChange = change?["new"] as? CGFloat {
//                activeBar.frame.origin.x = offsetToChange / 2
//                print(activeBar.frame)
//            }
        case "displayIndex":
            if let displayIndex = change?["new"] as? Int {
                self.changeActive(displayIndex)
            }
        default:
            break
        }
    }
    
    func createButtonOriginXArray() {
        for subview in self.view.subviews {
            if let button = subview as? UIButton {
                buttonOriginXArray.append(button.frame.origin.x)
            }
        }
    }
    
    func changeActive(index: Int) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.activeBar.frame.origin.x = self.buttonOriginXArray[index]
            switch index {
            case 0:
                self.changeActiveButton(self.day1Button)
                self.changeUnactiveButton(self.day2Button)
            case 1:
                self.changeUnactiveButton(self.day1Button)
                self.changeActiveButton(self.day2Button)
            default:
                break
            }
        })
    }
    
    func changeActiveButton(button: UIButton) {
        button.enabled = false
        button.backgroundColor = .whiteColor()
        button.setTitleColor(.blackColor(), forState: .Normal)
    }
    
    func changeUnactiveButton(button: UIButton) {
        button.enabled = true
        button.backgroundColor = .lightGrayColor()
        button.setTitleColor(.whiteColor(), forState: .Normal)
    }
    
    //mark day button
    
    @IBAction func onDay1Button(sender: UIButton) {
        movePage!(index: 0)
        self.changeActive(0)
    }
    
    @IBAction func onDay2Button(sender: UIButton) {
        movePage!(index: 1)
        self.changeActive(1)
    }
}
