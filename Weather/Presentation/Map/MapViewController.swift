//
//  MapViewController.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import Lottie

class MapViewController: UIViewController {
    
    //MARK: - Properties
    private var output: MapViewOutput?
    private var locationManager: CLLocationManager?
    private var currentLocation: CLLocation?
    private var selectedPoint: GeoPoint?
    private var mapView: GMSMapView?
    private var needFocucCurrentOnLoad = true
    private var headerLoadedView: UIView?
    private var isHeaderExpanded = false
    
    //MARK: - Constants
    private let headerCollapsedHeight: CGFloat = 180
    private let moscowPoint = GeoPoint(latitude: 39.907500, longitude: 116.397200)
    
    //MARK: - Outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerPullView: UIView!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var headerContentView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var animationView: UIView!
    
    
    //MARK: - Incapsulation
    
    func set(output: MapViewOutput) {
        self.output = output
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output?.didTriggerViewReadyEvent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.mapView?.frame = self.mapContainerView.bounds
    }
    
    //MARK: - Actions
    
    @IBAction func listButtonAction(_ sender: Any) {
        self.output?.didPressedListButton()
    }
    
    @IBAction func currentLocationButtonAction(_ sender: Any) {
        self.focusCurrentLocation()
    }
    
    //MARK: - Private
    
    func configureMap() {
        let mapView = GMSMapView(frame: self.mapContainerView.bounds)
        mapView.delegate = self
        self.mapView = mapView
        self.mapContainerView.addSubview(mapView)
    }
    
    private func configureLocationManager() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.requestAlwaysAuthorization()
            locationManager?.startUpdatingLocation()
        }
        
        self.currentLocationButton.isHidden = !CLLocationManager.locationServicesEnabled()
    }
    
    private func focusCurrentLocation() {
        let location = self.currentLocation?.coordinate ?? CLLocationCoordinate2D(latitude: self.moscowPoint.latitude, longitude: self.moscowPoint.longitude)
        self.focus(location: location)
        self.output?.didSelect(point: GeoPoint(latitude: location.latitude, longitude: location.longitude), with: "You")
    }
    
    private func focus(location: CLLocationCoordinate2D) {
        self.mapView?.animate(toLocation: location)
        self.mapView?.animate(toZoom: 15)
        self.mapView?.clear()

        let marker = GMSMarker()
        marker.position = location
        marker.map = self.mapView
    }
    
    private func configureGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeUp.direction = .up
        self.headerPullView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeDown.direction = .down
        self.headerPullView.addGestureRecognizer(swipeDown)
        
        self.headerView.clipsToBounds = true
    }
    
    private func updateHeader() {
        self.view.bringSubviewToFront(self.headerView)
        let height = !self.isHeaderExpanded ? self.headerCollapsedHeight + 320 : self.headerCollapsedHeight

        UIView.animate(withDuration: 0.3) {
            self.headerViewHeightConstraint.constant = height
            self.view.layoutSubviews()
            self.headerView.layoutSubviews()
        }
       
    }
    
    private func configureAnimationView() {
        let path = Bundle.main.path(forResource: "loader", ofType: "json") ?? String.empty
        let animation = AnimationView(filePath: path)
        animation.loopMode = .loop
        animation.play()
        animation.frame = self.animationView.bounds
        self.animationView.addSubview(animation)
    }
    
    //MARK: - Objc
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .up {
            if self.isHeaderExpanded {
                self.updateHeader()
                self.isHeaderExpanded.toggle()
            }
        } else if gesture.direction == .down {
            if !self.isHeaderExpanded {
                self.updateHeader()
                self.isHeaderExpanded.toggle()
            }
        }
    }
    
}


//MARK: - ViewInput

extension MapViewController: MapViewInput {
    
    func configureView() {
        self.configureMap()
        self.configureLocationManager()
        self.focusCurrentLocation()
        self.configureGestures()
        self.configureAnimationView()
        
        self.output?.didSelect(point: self.moscowPoint, with: "Moscow")
    }
    
    func updateHeaderWith(headerView: UIViewController) {
        for view in self.headerContentView.subviews {
            view.removeFromSuperview()
        }
        
        self.headerLoadedView = headerView.view
        self.headerContentView.addSubview(headerView.view)
        headerView.didMove(toParent: self)
    }
    
    func startHeaderAnimating() {
        self.animationView.isHidden = false
        self.headerContentView.isHidden = true
    }
    
    func stopHeaderAnimating() {
        self.animationView.isHidden = true
        self.headerContentView.isHidden = false
    }
    
}


//MARK: - Location Manager

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            self.currentLocation = location
            
            if self.needFocucCurrentOnLoad {
                self.focusCurrentLocation()
                self.needFocucCurrentOnLoad = false
            }
        }
        
    }
    
}


//MARK: - GoogleMapsDelegate

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        self.output?.didSelect(point: GeoPoint(latitude: location.latitude, longitude: location.longitude), with: name)
        
        self.focus(location: location)
    }
    
}

