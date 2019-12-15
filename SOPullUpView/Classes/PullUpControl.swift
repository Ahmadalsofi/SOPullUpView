//
//  PullUpController.swift
//  PullUpController
//
//  Created by Ahmad Sofi on 12/4/19.
//

import UIKit
@available(iOS 10.0, *)
public class SOPullUpControl {
    
    public init() {}
    public weak var dataSource : SOPullUpViewDataSource?
    public weak var delegate: SOPullUpViewDelegate?
    
    // Variable determines the next state of the card expressing that the card starts and collapased
    var nextState: PullUpStatus {
        return cardVisible ? .collapsed : .expanded
    }
    
    // Variable determines the height of main view
    var heightView: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var defaultpullUpViewHeight: CGFloat {
        return UIScreen.main.bounds.height * 0.7
    }
    
    // Variable determines the width of main view
    var widthView: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Variable for card view controller
    public var pullUpVC: UIViewController!
    
    // Variable for effects visual effect view
    var visualEffectView:UIVisualEffectView!
    
    // Starting and end card heights will be determined later
    var endCardHeight:CGFloat = 0.0
    var startCardHeight:CGFloat = 0.0
    
    // Current visible state of the card
    var cardVisible = false
    
    // Empty property animator array
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    let pullUpViewTag = -1996
    // main view
    var parentView: UIView?
    
    public func setupCard(from view: UIView) {
        
        endCardHeight   = (dataSource?.pullUpViewExpandedViewHeight?()) ?? defaultpullUpViewHeight
        startCardHeight = dataSource?.pullUpViewCollapsedViewHeight() ?? 0.0
        
        parentView = view
        // Add Visual Effects View
        visualEffectView = UIVisualEffectView()
        
        // Add CardViewController xib to the bottom of the screen, clipping bounds so that the corners can be rounded
        guard let safePullUpViewController = dataSource?.pullUpViewController() else {return}
        pullUpVC = safePullUpViewController
        pullUpVC.view.tag = pullUpViewTag
        
        view.addSubview(pullUpVC.view)
        
        pullUpVC.view.frame = CGRect(x: 0, y: heightView - startCardHeight, width: widthView, height: endCardHeight)
        pullUpVC.view.clipsToBounds = true
        pullUpVC.view.layer.cornerRadius = 15
        
        // Add tap and pan recognizers
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))
        
        let handleArea = delegate?.pullUpHandleArea(pullUpVC)
        handleArea?.addGestureRecognizer(tapGestureRecognizer)
        handleArea?.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    // used to hide the pullUpView from parentView
    public func hide() {
        parentView?.subviews.forEach { (subView) in
            if subView.tag == self.pullUpViewTag {
                    subView.isHidden = true
            }
        }
    }
    
    // used to show the pullUpView from parentView
    public func show() {
        parentView?.subviews.forEach { (subView) in
            if subView.tag == self.pullUpViewTag {
                    subView.isHidden = true
            }
        }
    }
    
     // used to change the status of pullUpView to expanded
    public func expanded() {
        animateTransitionIfNeeded(state: .expanded, duration: 0.9)
    }
    
    // used to change the status of pullUpView to collapsed
    public func collapsed() {
        animateTransitionIfNeeded(state: .collapsed, duration: 0.9)
    }
}
