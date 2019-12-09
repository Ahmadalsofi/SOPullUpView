//
//  SOPullUpViewDelegate.swift
//  Pods-SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//

import Foundation

/// Methods for managing status.
///
/// Use the method of this protocol to manage the following feature :
/// - Respond to view status.
/// - Handle area used to collapsed and exapned view
public protocol SOPullUpViewDelegate: NSObject {
    func pullUpViewStatus(didChangeTo status: PullUpStatus)
    func pullUpHandleArea() -> UIView
}
