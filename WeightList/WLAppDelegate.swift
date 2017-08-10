//
//  AppDelegate.swift
//  WIBTest
//
//  Created by seth piezas on 7/29/17.
//  Copyright © 2017 Alex K. All rights reserved.
//

import UIKit
import openframe

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




@UIApplicationMain
class WLAppDelegate: CLBIAppDelegate {
    override var options:[String:Any] {
        return [
            "views": [
                "statsview": "StatsView",
                "labelview": "LabelView",
                "chartview": "ChartView",
                "uiview": "TopView",
                "slideview": "SlideView"
            ],
            "root": "testview",
            "modes": [
                "initial": "#first",
                "initial.hidden": "#initial.hidden",
                "second": "#second"
            ],
        ] as [String:Any]
    }
}

extension WLAppDelegate {
}


