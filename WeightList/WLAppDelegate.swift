//
//  AppDelegate.swift
//  WIBTest
//
//  Created by seth piezas on 7/29/17.
//  Copyright © 2017 Alex K. All rights reserved.
//

import UIKit
import openframe

typealias GenericBridgeFN = (AnyObject, @escaping (Any) -> Void) -> Void

//TONIGHT COPY IN ALL WEIGHT APP SPECIFIC CODE

//var dateview:DateView?
//
//
//
//extension BrowserViewCell {
//}
//
//extension PostStreamVC {
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let rect = CGRect(x: 5, y: 20, width: 80, height: 80)
//        dateview = DateView(frame: rect)
//        return dv
//    }
//
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        var idx = Int(scrollView.contentOffset.y/height)
//        //configure dateview
//    }
//}


//@UIApplicationMain
//class WLAppDelegate: CLBIAppDelegate {
//    override var options:[String:Any] {
//        return [
//            "views": [
//                "statsview": "StatsView",
//                "labelview": "LabelView",
//                "chartview": "ChartView",
//                "uiview": "TopView",
//                "slideview": "SlideView"
//            ],
//            "root": "testview",
//            "modes": [
//                "initial": "#first",
//                "initial.hidden": "#initial.hidden",
//                "second": "#second"
//            ],
//        ] as [String:Any]
//    }
//
//
//}


extension CLBIAppDelegate {
    class func registerServiceHandlers() -> [String:GenericBridgeFN]{
        var fdict = [String:GenericBridgeFN]()
        var formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MM-dd"
        func retrievePedometerData(options:AnyObject, completion: @escaping (Any) -> Void) {
            for i in 0..<10 {
                StepManager.shared.loadStepData(i) {
                    (steps, arrayofsteps, date) in
                    let keydate = formatter.string(from: date)
                    let post = [
                        "steps": steps,
                        "histogram": arrayofsteps,
                        "date": keydate
                        ] as [String : Any] as [String : Any]
                    completion(post)
                }
            }
        }


        fdict["retrieveSteps"] = retrievePedometerData
        return fdict

    }
}


