//
//  LocationPullUpViewController.swift
//  SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import MapKit
import SOPullUpView
class LocationPullUpViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var locationTable: UITableView!
    
    // MARK: - Properties
    
    let locations = Location().locations
    
    weak var setLocationDelegate: SelectLocationDelegate?
    var pullUpControl: SOPullUpControl? {
        didSet {
            pullUpControl?.delegate = self
        }
    }
    
    // MARK: - Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



extension LocationPullUpViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell",for: indexPath)
        cell.textLabel?.text = locations[indexPath.row].title
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pullUpControl?.dismiss()
        setLocationDelegate?.didSelectLocation(location: locations[indexPath.row].location)
    }
}

// MARK: - SOPullUpViewDelegate

extension LocationPullUpViewController: SOPullUpViewDelegate {
    func pullUpViewStatus(_ sender: UIViewController,didChangeTo status: PullUpStatus) {
        print("SOPullUpView status is \(status)")
    }
    
    func pullUpHandleArea(_ sender: UIViewController) -> UIView {
        return handleArea
    }
}
