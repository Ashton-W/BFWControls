//
//  UIViewMorphExtensions.swift
//  BFWControls
//
//  Created by Tom Brodhurst-Hill on 14/02/2016.
//  Copyright © 2016 BareFeetWare.
//  Free to use at your own risk, with acknowledgement to BareFeetWare.
//

import UIKit

extension UIView {
    
    func isMorphableTo(view: UIView) -> Bool {
        var isMorphable = false
        if tag != 0 && tag == view.tag {
            isMorphable = true
        } else if view is UILayoutSupport && self is UILayoutSupport {
            if CGPointEqualToPoint(view.frame.origin, CGPointZero) == CGPointEqualToPoint(frame.origin, CGPointZero) {
                isMorphable = true
            }
        }
        return isMorphable
    }
    
    func subviewMatchingView(view: UIView) -> UIView? {
        var matchingSubview: UIView?
        if view.tag != 0 {
            matchingSubview = viewWithTag(view.tag)
        } else {
            for subview in subviews {
                if subview.isMorphableTo(view) {
                    matchingSubview = subview
                    break
                }
            }
        }
        return matchingSubview;
    }

}

extension UILabel {
    
    override func isMorphableTo(view: UIView) -> Bool {
        var isMorphable = super.isMorphableTo(view)
        if !isMorphable {
            if let label = view as? UILabel {
                isMorphable = text == label.text
            }
        }
        return isMorphable
    }
    
}

extension UIImageView {
    
    override func isMorphableTo(view: UIView) -> Bool {
        var isMorphable = super.isMorphableTo(view)
        if !isMorphable {
            if let imageView = view as? UIImageView,
                let image = image
            {
                isMorphable = image.isEqual(imageView.image)
            }
        }
        return isMorphable
    }
    
}