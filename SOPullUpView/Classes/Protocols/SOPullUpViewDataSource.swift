//
//  SOPullUpViewDataSource.swift
//  Pods-SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/4/19.
//

import Foundation
@available(iOS 10.0, *)
@objc public protocol SOPullUpViewDataSource {
    
    /// This function used to take the height when the pullUpView is collapsed.
    func pullUpViewStartViewHeight() -> CGFloat
    
    /// This function used to take the SOPullUpMainViewController to be displayed.

    func pullUpViewController() -> UIViewController
    
    /// This function used to take the height when the pullUpView is expanded.
    /// optional to implement, its return UIScreen.main.bounds.height * 0.7 by default
    @objc optional func pullUpViewEndViewHeight() -> CGFloat
}

@available(iOS 10.0, *)
extension SOPullUpViewDataSource {
    func pullUpViewEndViewHeight() -> CGFloat {
        return UIScreen.main.bounds.height * 0.7
    }
}

/*
  *Defines possible states of the bottom controller.
*/

public enum PullUpStatus {
  case collapsed
  case expanded
}
