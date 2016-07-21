//
//  TalksAPIType.swift
//  PyConJP2016
//
//  Created by Yutaro Muta on 4/23/16.
//  Copyright © 2016 Yutaro Muta. All rights reserved.
//

import UIKit
import RealmSwift

protocol TalksAPIType: AlamofireType {
    //    func getTalks(parameter: Dictionary<String, AnyObject>?, successClosure success: (NSDictionary) -> Void, failClosure fail: (NSError) -> Void) -> Void
}

extension TalksAPIType {
    
    var path: String {
        return "talks/list/"
    }
    
    //    func getTalks(parameter: Dictionary<String, AnyObject>?, successClosure success: ([Talk]) -> Void, failClosure fail: (NSError) -> Void) {
    //        get(parameter, successClosure: { dictionary in
    //            let presentations = dictionary["presentations"] as? Array<Dictionary<String, AnyObject>> ?? Array()
    //
    //            let talks = presentations.map({
    //                Talk(dictionary: $0)
    //            })
    //
    //            success(talks)
    //
    //            }, failClosure: { error in
    //
    //        })
    //    }
    
    func getTalks(successClosure success: () -> Void, failClosure fail: (NSError) -> Void) {
        get(nil, successClosure: { dictionary in
            let presentations = dictionary["presentations"] as? Array<Dictionary<String, AnyObject>> ?? Array()
            
            let realm = try! Realm()
            try! realm.write({
                presentations.forEach({
                    let talkObject = TalkObject(dictionary: $0)
                    realm.add(talkObject, update: true)
                })
            })
            
            success()
            
            }, failClosure: { error in
                fail(error)
        })
    }
    
}
