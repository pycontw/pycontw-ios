//
//  AppDelegateExtension.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 2016/03/15.
//  Copyright © 2016 PyCon JP. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func showAlert(_ alertController: UIAlertController) {
        self.window?.rootViewController?.presentingViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func openTalkDetailViewController(_ id: Int) {
        let talkDetailViewController = TalkDetailViewController.build(id)
        self.window?.rootViewController?.presentedViewController?.navigationController?.pushViewController(talkDetailViewController, animated: true)
    }
    
}
