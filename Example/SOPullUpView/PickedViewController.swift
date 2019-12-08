//
//  PickedViewController.swift
//  SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SOPullUpView

class PickedViewController: UIViewController {
    
    
    // MARK: - Properties
    
    let pullUpController = SOPullUpControl()

    // used to return bottom Padding of safe area.
    var bottomPadding: CGFloat {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? 0.0
    }
    
    // MARK: - Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullUpController.dataSource = self
        pullUpController.setupCard(from: view)
        
        // UI configuration
        title = "Picked Example"
    }
}

// MARK: - SOPullUpViewDataSource

extension PickedViewController: SOPullUpViewDataSource {
    func pullUpViewStartViewHeight() -> CGFloat {
        return bottomPadding + 40
    }
     
    func pullUpViewController() -> UIViewController {
        guard let vc = UIStoryboard(name: "PickedPull", bundle: nil).instantiateInitialViewController() as? PickedPullUpViewController else {return UIViewController()}
        vc.pullUpControl = self.pullUpController
        return vc
    }
}
