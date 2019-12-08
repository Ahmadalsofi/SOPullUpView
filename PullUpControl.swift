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
    
        // Variable determines the width of main view
        var widthView: CGFloat {
            return UIScreen.main.bounds.width
        }
    
        // Variable for card view controller
        var pullUpViewControl: UIViewController!
        
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
   
        public func setupCard(from view: UIView) {
    
            endCardHeight   = dataSource?.pullUpViewEndViewHeight() ?? 0.0
            startCardHeight = dataSource?.pullUpViewStartViewHeight() ?? 0.0
            
            // Add Visual Effects View
            visualEffectView = UIVisualEffectView()

            // Add CardViewController xib to the bottom of the screen, clipping bounds so that the corners can be rounded
            guard let pullUpView = dataSource?.pullUpViewController() else {return}
            pullUpViewControl = pullUpView
            view.addSubview(pullUpViewControl.view)
            pullUpViewControl.view.frame = CGRect(x: 0, y: heightView - startCardHeight, width: widthView, height: endCardHeight)
            pullUpViewControl.view.clipsToBounds = true
            pullUpViewControl.view.layer.cornerRadius = 15
            // Add tap and pan recognizers
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognzier:)))
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))
   
            let handleArea = delegate?.pullUpHandleArea()
            handleArea?.addGestureRecognizer(tapGestureRecognizer)
            handleArea?.addGestureRecognizer(panGestureRecognizer)
            
        }
    
        public func dismiss() {
            animateTransitionIfNeeded(state: .collapsed, duration: 0.9)
        }

        public func show() {
            animateTransitionIfNeeded(state: .expanded, duration: 0.9)
        }
        
        // Handle tap gesture recognizer
        @objc
        func handleCardTap(recognzier:UITapGestureRecognizer) {
            switch recognzier.state {
                // Animate card when tap finishes
            case .ended:
                animateTransitionIfNeeded(state: nextState, duration: 0.9)
            default:
                break
            }
        }
        
        // Handle pan gesture recognizer
        @objc
        func handleCardPan (recognizer:UIPanGestureRecognizer) {
            switch recognizer.state {
            case .began:
                // Start animation if pan begins
                startInteractiveTransition(state: nextState, duration: 0.9)
            case .changed:

             let translation = recognizer.translation(in: self.pullUpViewControl.view)
                var fractionComplete = translation.y / endCardHeight
                fractionComplete = cardVisible ? fractionComplete : -fractionComplete
                updateInteractiveTransition(fractionCompleted: fractionComplete)
            case .ended:
                // End animation when pan ends
                continueInteractiveTransition()
            default:
                break
            }
       }
}
