//
//  SystemExtensions.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit

extension UIColor {
    static let background = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    static let customBlack = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
}

extension UIView {
    
    func dropShadow() {
        layer.shadowColor = UIColor.customBlack.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 30
    }
    
    func anchor(_ top: NSLayoutYAxisAnchor?, _ leading: NSLayoutXAxisAnchor?, _ bottom: NSLayoutYAxisAnchor?, _ trailing: NSLayoutXAxisAnchor?, _ tp: CGFloat?, _ lp: CGFloat?, _ bp: CGFloat?, _ trp: CGFloat?, _ width: CGFloat?, _ height: CGFloat?) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top, let tp = tp {topAnchor.constraint(equalTo: top, constant: tp).isActive = true}
        if let leading = leading, let lp = lp {leadingAnchor.constraint(equalTo: leading, constant: lp).isActive = true}
        if let bottom = bottom, let bp = bp {bottomAnchor.constraint(equalTo: bottom, constant: -bp).isActive = true}
        if let trailing = trailing, let trp = trp {trailingAnchor.constraint(equalTo: trailing, constant: -trp).isActive = true}
        if let width = width {widthAnchor.constraint(equalToConstant: width).isActive = true}
        if let height = height {heightAnchor.constraint(equalToConstant: height).isActive = true}
    }
    
    func center(_ centerX: NSLayoutXAxisAnchor?, _ centerY: NSLayoutYAxisAnchor?, _ cX: CGFloat?, _ cY: CGFloat?, _ width: CGFloat?, _ height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerX = centerX, let cX = cX {centerXAnchor.constraint(equalTo: centerX, constant: cX).isActive = true}
        if let centerY = centerY, let cY = cY {centerYAnchor.constraint(equalTo: centerY, constant: cY).isActive = true}
        if let width = width {widthAnchor.constraint(equalToConstant: width).isActive = true}
        if let height = height {heightAnchor.constraint(equalToConstant: height).isActive = true}
    }
}
