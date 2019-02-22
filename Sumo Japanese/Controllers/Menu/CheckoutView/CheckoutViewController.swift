//
//  CheckoutViewController.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pickupLocationView: UIStackView!
    @IBOutlet weak var pickupView: UIView!
    @IBOutlet weak var infoCheckout: UITableView!
    @IBAction func continueButton(_ sender: Any) {
                performSegue(withIdentifier: "segueToPaymentFromCheckoutView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellClutery = UINib(nibName: "CutleryTableViewCell", bundle: nil)
        infoCheckout.register(cellClutery, forCellReuseIdentifier: "_cutleryTableViewCell")
        let cellOrderOwner = UINib(nibName: "OrderOwnerTableViewCell", bundle: nil)
        infoCheckout.register(cellOrderOwner, forCellReuseIdentifier: "_orderOwnerTableViewCell")
        let cellOrderInstructions = UINib(nibName: "OrderInstructionsTableViewCell", bundle: nil)
        infoCheckout.register(cellOrderInstructions, forCellReuseIdentifier: "_orderInstructionsTableViewCell")
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(tapHandler))
        tap.minimumPressDuration = 0
        pickupView.addGestureRecognizer(tap)
        
        let tapLocation = UILongPressGestureRecognizer(target: self, action: #selector(tapHandlerLocation))
        tapLocation.minimumPressDuration = 0
        pickupLocationView.addGestureRecognizer(tapLocation)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellClutery = tableView.dequeueReusableCell(withIdentifier: "_cutleryTableViewCell") as? CutleryTableViewCell
        let cellOrderOwner = tableView.dequeueReusableCell(withIdentifier: "_orderOwnerTableViewCell") as? OrderOwnerTableViewCell
        let cellOrderInstructions = tableView.dequeueReusableCell(withIdentifier: "_orderInstructionsTableViewCell") as? OrderInstructionsTableViewCell
        
        switch indexPath.row {
        case 0:
            return (cellClutery!)
        case 1:
            return (cellOrderOwner!)
        case 2:
            return (cellOrderInstructions!)
        default:
            return (cellClutery!)
        }
    }
    
    @objc func tapHandler(gesture: UITapGestureRecognizer) {
        if  gesture.state == .began {
            performSegue(withIdentifier: "segueToPickupTimeFromCheckout", sender: nil)
        }
    }
    @objc func tapHandlerLocation(gesture: UITapGestureRecognizer) {
        if  gesture.state == .began {
            performSegue(withIdentifier: "segueFromCheckoutViewToNearestLocation", sender: nil)
        }
    }


}
