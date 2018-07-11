//
//  PushButton.swift
//  CoreGraphicsRW
//
//  Created by Dustin Howell on 7/10/18.
//  Copyright © 2018 Dustin Howell. All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        
        plusPath.lineWidth = Constants.plusLineWidth
        
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfPlusWidth))
        }
        
        UIColor.white.setStroke()
        plusPath.stroke()

    }
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 4.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
}
