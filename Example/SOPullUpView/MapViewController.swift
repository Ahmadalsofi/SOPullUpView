//
//  MapViewController.swift
//  SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import MapKit
import SOPullUpView

protocol SelectLocationDelegate: NSObject {
    func didSelectLocation(location: CLLocationCoordinate2D)
}

class MapViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    
    private let pullUpControl = SOPullUpControl()
    private let navigationColor =  UIColor(red: 21/255, green: 127/255, blue: 60/255, alpha: 1)
    
    // used to return bottom Padding of safe area.
    var bottomPadding: CGFloat {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? 0.0
    }
    
    // MARK: - Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullUpControl.dataSource = self
        pullUpControl.setupCard(from: view)
        
        // UI configuration
        title = "MAP Example"
        self.overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.barTintColor = navigationColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // UI configuration
        self.overrideUserInterfaceStyle = .light
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
}

// MARK: - SOPullUpViewDataSource

extension MapViewController: SOPullUpViewDataSource {
    
    func pullUpViewCollapsedViewHeight() -> CGFloat {
         return bottomPadding + 40
    }
    
    func pullUpViewController() -> UIViewController {
        guard let vc = UIStoryboard(name: "LocationPullUp", bundle: nil).instantiateInitialViewController() as? LocationPullUpViewController else {return UIViewController()}
        vc.setLocationDelegate = self
        vc.pullUpControl = self.pullUpControl
        return vc
    }
}

// MARK: - SelectLocationDelegate

extension MapViewController: SelectLocationDelegate {
    func didSelectLocation(location: CLLocationCoordinate2D) {
        let camera = MKMapCamera(lookingAtCenter: location, fromDistance: 10000, pitch: 1000, heading: 0)
        mapView.camera = camera
    }
}

