//
//  ViewControllerTransitioning.swift
//  Autolayout_VC_Transition
//
//  Created by jhlee on 2023/09/06.
//

import Foundation
import UIKit

// UIViewControllerTransitioningDelegate - 프로토콜 채택으로 화면 전환에 대한 설정을 하는 곳
// UIViewControllerAnimatedTransitioning - 실제 화면전환에 맞는 애니메이션 구현을 하는 곳

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = PresentTransitionAnimator()
        
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransitionAnimator()
    }
}

class DismissTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let detailVC = transitionContext.viewController(forKey: .from) as! DetailViewController
        let homeVC = transitionContext.viewController(forKey: .to) as! ViewController
        
        let imageView = UIImageView()
        imageView.frame = detailVC.bigImageView.frame
        imageView.image = detailVC.bigImageView.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        containerView.addSubview(imageView)
        
        let myLabel = UILabel()
        myLabel.frame = detailVC.detailLabel.frame
        myLabel.text = detailVC.detailLabel.text
        
        containerView.addSubview(myLabel)
        
        detailVC.view.alpha = 0
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration) {
            
            imageView.frame = homeVC.selectedImageFrame!
            myLabel.frame = homeVC.selectedLabelFrame!
            
        } completion: { _ in
            myLabel.removeFromSuperview()
            imageView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }

    }
    
}

class PresentTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let homeVC = transitionContext.viewController(forKey: .from) as! ViewController
        let detailVC = transitionContext.viewController(forKey: .to) as! DetailViewController
        
        let homeImageFrame = homeVC.selectedImageFrame
        let homeImage = homeVC.selectedImage
        let homeLabelFrame = homeVC.selectedLabelFrame
        
        
        containerView.backgroundColor = .white
        homeVC.view.alpha = 0
        detailVC.view.alpha = 0
        let duration = transitionDuration(using: transitionContext)

        
        let imageView = UIImageView(image: homeImage)
        imageView.frame = homeImageFrame!
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        containerView.addSubview(imageView)
        
        
        let myLabel = UILabel(frame: homeLabelFrame!)
        myLabel.text = homeVC.selectedString
        containerView.addSubview(myLabel)
        
        
        containerView.addSubview(detailVC.view)
        // layout update.......
        detailVC.view.layoutIfNeeded()
        
 
            // 애니메이션
//            UIView.animate(withDuration: duration) {
//                imageView.frame = detailVC.bigImageView.frame
//                myLabel.frame = detailVC.detailLabel.frame
//
//            } completion: { _ in
//                homeVC.view.alpha = 1
//                imageView.removeFromSuperview()
//                myLabel.removeFromSuperview()
//                detailVC.view.alpha = 1
//                transitionContext.completeTransition(true)
//            }
        
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3) {
            imageView.frame = detailVC.bigImageView.frame
            myLabel.frame = detailVC.detailLabel.frame

        } completion: { _ in
            homeVC.view.alpha = 1
            imageView.removeFromSuperview()
            myLabel.removeFromSuperview()
            detailVC.view.alpha = 1
            transitionContext.completeTransition(true)

        }
 
        
                
    }
    
    
}

