//
//  MapViewController.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    let mapView = GMSMapView()
    let markerImageView = UIImageView(image: UIImage(named: "marker"))
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = UIColor.customBlack
        button.addTarget(self, action: #selector(handleCloseMap), for: .touchUpInside)
        return button
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-Bold", size: 28)
        label.textColor = UIColor.customBlack
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    let iAmHereButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Я здесь", for: .normal)
        button.setTitleColor(UIColor.customBlack, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial-Regular", size: 20)
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(handleTouchDownIAmHereButton), for: .touchDown)
        button.addTarget(self, action: #selector(handleTouchDragOutsideIAmHereButton), for: .touchDragOutside)
        button.addTarget(self, action: #selector(handleTouchUpInsideIAmHereButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleTouchDownIAmHereButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.iAmHereButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
    @objc func handleTouchDragOutsideIAmHereButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.iAmHereButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    @objc func handleTouchUpInsideIAmHereButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.iAmHereButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleCloseMap() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureMap() {
        [mapView, markerImageView].forEach {view.addSubview($0)}
        mapView.frame = view.frame
        mapView.padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        markerImageView.center(view.centerXAnchor, view.centerYAnchor, 0, -32, 40, 64)
    }
    
    func configureElements() {
        [closeButton, iAmHereButton, addressLabel].forEach {view.addSubview($0)}
        closeButton.anchor(view.safeAreaLayoutGuide.topAnchor, view.leadingAnchor, nil, nil, 30, 30, nil, nil, 30, 30)
        iAmHereButton.anchor(nil, view.leadingAnchor, view.safeAreaLayoutGuide.bottomAnchor, view.trailingAnchor, nil, 30, 30, 30, nil, 60)
        addressLabel.anchor(closeButton.bottomAnchor, view.leadingAnchor, nil, view.trailingAnchor, 30, 30, nil, 30, nil, 120)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        configureMap()
        configureElements()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print(location)
        GMSGeocoder().reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)) { (response, error) in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                self.addressLabel.text = lines[0]
            }
        }
    }
}
