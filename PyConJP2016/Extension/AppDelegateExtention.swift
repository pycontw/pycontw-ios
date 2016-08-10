//
//  AppDelegateExtention.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 2016/03/15.
//  Copyright © 2016 Yutaro Muta. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func showAlert(alertController: UIAlertController) {
        self.window?.rootViewController?.presentingViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func openTalkDetailViewController(id: Int, title: String) {
        let talkDetailViewController = TalkDetailViewController.build(id, title: title)
        self.window?.rootViewController?.presentedViewController?.navigationController?.pushViewController(talkDetailViewController, animated: true)
    }
    
}