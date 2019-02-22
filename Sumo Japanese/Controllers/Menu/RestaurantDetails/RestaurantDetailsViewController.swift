//
//  RestaurantDetailsViewController.swift
//  Sumo Japanese
//
//  Created by imac on 13/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit
import MapKit

struct businessHours {
    var dayName = String()
    var openTime = String()
    var closeTime = String()
}

class RestaurantDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var favorite: Bool = false
    
    @IBOutlet weak var heighOfScrollContent: NSLayoutConstraint!
    @IBOutlet weak var tableSchedule: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func favoriteAction(_ sender: UIButton, forEvent event: UIEvent) {
        favorite = !favorite
        if favorite {
            sender.setImage(UIImage(named: "icon_favorite_full"), for: UIControl.State.normal)
        } else {
            sender.setImage(UIImage(named: "icon_favorite_unfull"), for: UIControl.State.normal)
        }
    }
    
    var restaurantSchedule = [businessHours]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        tableSchedule.register(cellNib, forCellReuseIdentifier: "_scheduleTableViewCell")
        
        restaurantSchedule = [
            businessHours(dayName: "Monday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Tuesday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Wednesday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Thursday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Friday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Saturday", openTime: "11:00AM", closeTime: "10:00PM"),
            businessHours(dayName: "Sunday", openTime: "11:00AM", closeTime: "10:00PM")
        ]
        heighOfScrollContent.constant += CGFloat(57 * restaurantSchedule.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantSchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "_scheduleTableViewCell") as? ScheduleTableViewCell
        let rangeTime : String = String(restaurantSchedule[indexPath.row].openTime) + " - " + String(restaurantSchedule[indexPath.row].closeTime)
        cell?.setLabels(text: restaurantSchedule[indexPath.row].dayName, label: 0)
        cell?.setLabels(text: rangeTime, label: 1)
        return (cell!)
    }

}
