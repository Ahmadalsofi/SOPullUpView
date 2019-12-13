//
//  PickedPullUpViewController.swift
//  SOPullUpView_Example
//
//  Created by Ahmad Sofi on 12/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SOPullUpView
class PickedPullUpViewController: UIViewController {
    
    // MARK: - Outlet

    @IBOutlet weak var pickedTable: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var handleArea: UIView!
    
    // MARK: - Properties

    var pullUpControl: SOPullUpControl? {
        didSet {
            pullUpControl?.delegate = self
        }
    }
    
    // MARK: - Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.alpha = 0
    }
}

// MARK: - SOPullUpViewDelegate

extension PickedPullUpViewController: SOPullUpViewDelegate {

    func pullUpViewStatus(_ sender: UIViewController, didChangeTo status: PullUpStatus) {
        switch status {
        case .collapsed:
            UIView.animate(withDuration: 0.6)  { [weak self] in
                self?.titleLbl.alpha = 0
            }
        case .expanded:
            UIView.animate(withDuration: 0.6) { [weak self] in
                self?.titleLbl.alpha = 1
            }
        }
    }
    
    func pullUpHandleArea(_ sender: UIViewController) -> UIView {
        return handleArea
    }
}

// MARK: - UITableViewDelegate , UITableViewDataSource

extension PickedPullUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
}
