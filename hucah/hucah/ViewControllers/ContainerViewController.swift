//
//  ViewController.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, animateMenuViewControllerDelegate {
    
    var isMenuOpened = false
    
    var mainViewController: MainViewController!
    var menuViewController: MenuViewController!
    
    func animateMenuViewController() {
        configureMenuViewController()
        if !isMenuOpened {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.mainViewController.view.frame = CGRect(x: self.view.frame.width * 2 / 3, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.menuViewController.view.frame = CGRect(x: -self.view.frame.width * 1 / 3, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.mainViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.menuViewController.view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
        }
        isMenuOpened = !isMenuOpened
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.addSubview(menuViewController.view)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
            menuViewController.view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    func configureMainViewController() {
        mainViewController = MainViewController()
        mainViewController.delegate = self
        view.addSubview(mainViewController.view)
        addChild(mainViewController)
        mainViewController.didMove(toParent: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        view.backgroundColor = UIColor.background
        configureMainViewController()
    }
}

