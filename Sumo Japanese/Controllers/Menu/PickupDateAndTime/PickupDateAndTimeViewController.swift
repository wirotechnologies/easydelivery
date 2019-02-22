//
//  PickupDateAndTimeViewController.swift
//  Sumo Japanese
//
//  Created by imac on 12/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

struct dateCalendar {
    var month = String()
    var dayNumber = String()
    var dayName = String()
    var selected = Bool()
}

class PickupDateAndTimeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var CollectionDates: UICollectionView!
    @IBAction func saveDateAndTime(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var daysToPickup = [dateCalendar]()
    
    override func viewDidLoad() {
        daysToPickup = [
            dateCalendar(month: "Febraury", dayNumber: "1", dayName: "Monday", selected: true),
            dateCalendar(month: "Febraury", dayNumber: "2", dayName: "Tuesday", selected: false),
            dateCalendar(month: "Febraury", dayNumber: "3", dayName: "Wednesday", selected: false),
            dateCalendar(month: "Febraury", dayNumber: "4", dayName: "Thusday", selected: false),
            dateCalendar(month: "Febraury", dayNumber: "5", dayName: "Friday", selected: false),
            dateCalendar(month: "Febraury", dayNumber: "6", dayName: "Saturday", selected: false),
            dateCalendar(month: "Febraury", dayNumber: "7", dayName: "Sunday", selected: false)
        ]
        
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "DaysCollectionViewCell", bundle: nil)
        CollectionDates.register(nibCell, forCellWithReuseIdentifier: "_daysCollectionViewCell")

    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysToPickup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "_daysCollectionViewCell", for: indexPath) as! DaysCollectionViewCell
        cell.setCalendar(month: daysToPickup[indexPath.row].month, dayNumber: daysToPickup[indexPath.row].dayNumber, dayName: daysToPickup[indexPath.row].dayName, index: indexPath.row)
        cell.setSelected(selected: daysToPickup[indexPath.row].selected)
        print(daysToPickup)
        return (cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<daysToPickup.count{
            if i == indexPath.row{
                daysToPickup[indexPath.row].selected = true
                collectionView.reloadData()
            } else if daysToPickup[i].selected == true{
                daysToPickup[i].selected = false
               collectionView.reloadData()
           }
        }
    }

}
