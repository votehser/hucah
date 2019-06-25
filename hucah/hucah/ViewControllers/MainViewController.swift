//
//  MainViewController.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var delegate: ContainerViewController!
    
    var safeView = UIView()
    
    let navigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.background
        return view
    }()
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        button.tintColor = UIColor.customBlack
        return button
    }()
    
    let addressButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(handleTouchDownAddressButton), for: .touchDown)
        button.addTarget(self, action: #selector(handleTouchDragOutsideAddressButton), for: .touchDragOutside)
        button.addTarget(self, action: #selector(handleTouchUpInsideAddressButton), for: .touchUpInside)
        return button
    }()
    
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.background
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    @objc func handleMenuButton() {
        delegate.animateMenuViewController()
        safeView.alpha = 1
    }
    
    @objc func handleTouchDownAddressButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.addressButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    @objc func handleTouchDragOutsideAddressButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.addressButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    @objc func handleTouchUpInsideAddressButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.addressButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        let mapViewController = MapViewController()
        self.present(mapViewController, animated: true)
    }
    
    func configureNavigationBar() {
        view.addSubview(navigationBar)
        [menuButton].forEach {navigationBar.addSubview($0)}
        navigationBar.anchor(view.safeAreaLayoutGuide.topAnchor, view.leadingAnchor, nil, view.trailingAnchor, 0, 0, nil, 0, nil, 90)
        menuButton.anchor(navigationBar.topAnchor, navigationBar.leadingAnchor, nil, nil, 30, 30, nil, nil, 30, 30)
    }
    
    func configureAddressButton() {
        view.addSubview(addressButton)
        addressButton.anchor(navigationBar.bottomAnchor, view.leadingAnchor, nil, view.trailingAnchor, 15, 30, nil, 30, nil, 60)
    }
    
    func configureMenuCollectionView() {
        view.addSubview(menuCollectionView)
        menuCollectionView.anchor(addressButton.bottomAnchor, view.leadingAnchor, view.safeAreaLayoutGuide.bottomAnchor, view.trailingAnchor, 60, 0, 60, 0, nil, nil)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
    }
    
    func configureSafeView() {
        view.addSubview(safeView)
        safeView.anchor(view.topAnchor, view.leadingAnchor, view.bottomAnchor, view.trailingAnchor, 0, 0, 0, 0, nil, nil)
        safeView.alpha = 0
        safeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnSafeView(_:))))
    }
    
    @objc func handleTapOnSafeView(_ recognizer: UITapGestureRecognizer) {
        safeView.alpha = 0
        delegate.animateMenuViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        configureNavigationBar()
        configureAddressButton()
        configureMenuCollectionView()
        configureSafeView()
    }
}
