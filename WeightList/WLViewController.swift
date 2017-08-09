//
//  ViewController.swift
//  WIBTest
//
//  Created by seth piezas on 7/29/17.
//  Copyright © 2017 Alex K. All rights reserved.
//

import UIKit
import WebKit





class CLBIStyleViewController : UIViewController {
    override var prefersStatusBarHidden: Bool {
        return false;
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        setNeedsStatusBarAppearanceUpdate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class WeightListDetailViewController : CLBIStyleViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}



