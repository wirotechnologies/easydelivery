//
//  InitialSearchViewController.swift
//  Sumo Japanese
//
//  Created by imac on 22/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

struct placeCell{
    var image = String()
    var name = String()
    var time = String()
}

struct itemCell{
    var image = String()
    var name = String()
    var price = Float()
    var place = String()
}

class InitialSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var burgerPlaces = [placeCell]()
    var burgerItems = [itemCell]()
    
    @IBOutlet weak var selectorOutlet: UISegmentedControl!
    @IBAction func selectorPlaceOrItems(_ sender: UISegmentedControl) {
        let indexSegment = sender.selectedSegmentIndex
        switch indexSegment {
        case 0:
            tableSearch.reloadData()
        case 1:
            tableSearch.reloadData()
        default:
            print("default case")
        }
    }
    @IBOutlet weak var tableSearch: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "PlacesTableViewCell", bundle: nil)
        tableSearch.register(nibCell, forCellReuseIdentifier: "_placesTableViewCell")
        let nibCellItem = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableSearch.register(nibCellItem, forCellReuseIdentifier: "_itemTableViewCell")
        
        burgerPlaces = [
            placeCell(image: "circle_logo_bacon_burgers", name: "Bacon Burgers", time: "40 - 50 min | 0.5 mi away"),
            placeCell(image: "circle_logo_presto", name: "Presto Burgers", time: "10 - 20 min | 0.2 mi away"),
            placeCell(image: "circle_logo_mac_donalds", name: "McDonald's", time: "30 - 40 min | 0.5 mi away"),
            placeCell(image: "circle_logo_delicious_burgers", name: "Delicious Burgers", time: "10 - 20 min | 0.4 mi away"),
            placeCell(image: "circle_logo_subway", name: "Subway", time: "40 - 50 min | 0.5 mi away"),
            placeCell(image: "circle_logo_burger_king", name: "Burger King", time: "10 - 20 min | 0.2 mi away"),
            placeCell(image: "circle_logo_beer_burger", name: "Beer Burger", time: "30 - 40 min | 0.5 mi away")
        ]
        burgerItems = [
            itemCell(image: "american_classic_burger", name: "American Classic Burger", price: 7.00, place: "McDonald's"),
            itemCell(image: "big_latin_burger", name: "Big Latin Burger", price: 6.00, place: "Presto"),
            itemCell(image: "black_beauty_burger", name: "Black Beauty Burger", price: 8.50, place: "Bacon Burgers"),
            itemCell(image: "chicken_jack_burger", name: "Chicken Jack Buerger", price: 10.00, place: "Beer Burger"),
            itemCell(image: "mini_japanese_burger", name: "Mini Japanese Burger", price: 9.99, place: "Delicious Burger"),
            itemCell(image: "special_burger", name: "Special Burger", price: 8.00, place: "Burger King")
        ]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let indexSegment = selectorOutlet.selectedSegmentIndex
        switch indexSegment {
        case 0:
            return burgerPlaces.count
        case 1:
            return burgerItems.count
        default:
            return burgerPlaces.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexSegment = selectorOutlet.selectedSegmentIndex
        let cell = tableView.dequeueReusableCell(withIdentifier: "_placesTableViewCell") as? PlacesTableViewCell
        let cellItem = tableView.dequeueReusableCell(withIdentifier: "_itemTableViewCell") as? ItemTableViewCell
        
        switch indexSegment {
        case 0:
            cell?.setImage(nameImage: burgerPlaces[indexPath.row].image)
            cell?.setPlaceName(namePlace: burgerPlaces[indexPath.row].name)
            cell?.setPlaceTime(time: burgerPlaces[indexPath.row].time)
            return cell!
        case 1:
            cellItem?.setImage(nameImage: burgerItems[indexPath.row].image)
            cellItem?.setItemName(nameItem: burgerItems[indexPath.row].name)
            cellItem?.setItemPrice(price: ("$" + String(burgerItems[indexPath.row].price) + " | " + burgerItems[indexPath.row].place))
            return cellItem!
        default:
            return cell!
        }
    }
    
}
