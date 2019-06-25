//
//  MenuCell.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let underView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 60
        return view
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        label.textColor = UIColor.background
        label.dropShadow()
        label.layer.cornerRadius = 60
        label.numberOfLines = 2
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.underView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(underView)
        underView.anchor(topAnchor, leadingAnchor, bottomAnchor, trailingAnchor, 0, 0, 0, 0, nil, nil)
        underView.addSubview(name)
        name.anchor(nil, underView.leadingAnchor, underView.bottomAnchor, underView.trailingAnchor, nil, 30, 30, 30, nil, 120)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
