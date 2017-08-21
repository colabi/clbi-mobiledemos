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


@UIApplicationMain
class WLAppDelegate: CLBIAppDelegate {
    override open var options:[String:Any] {
        return [
            "appurl": "",
            "views": [
                "statsview": "StatsView",
                "labelview": "LabelView",
                "chartview": "ChartView",
                "uiview": "TopView",
                "slideview": "SlideView"
            ],
            "root": "testview",
            "vcs": [
                "browser": [
                    "controller": "StepBrowserVC",
                    "views": [
                        "statsview": "StatsView",
                        "labelview": "LabelView",
                        "chartview": "ChartView",
                        "uiview": "TopView",
                        "slideview": "SlideView"
                    ],
                    "modes": [
                        "initial": "#first",
                        "initial.hidden": "#initial.hidden",
                        "second": "#second"
                    ]
                ]
            ],
            "modes": [
                "initial": "#first",
                "initial.hidden": "#initial.hidden",
                "second": "#second"
            ],
            ] as [String:Any]
    }
    
    override open func registerServiceHandlers() -> [String:openframe.GenericBridgeFN]? {
        var fdict = [String:openframe.GenericBridgeFN]()
        var formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyy-MM-dd"
        func retrievePedometerData(options:AnyObject, completion: @escaping (Any) -> Void) {
            for i in 0..<1 {
                openframe.StepManager.shared.loadStepData(i) {
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
        
        func retrievePhotos(options:AnyObject, completion: @escaping (Any) -> Void) {
            let post = [
                "photos": [],
                ] as [String : Any] as [String : Any]
            completion(post)
        }
        

        fdict["retrieveSteps"] = retrievePedometerData
        fdict["retrievePhotos"] = retrievePhotos
        return fdict

    }
}


