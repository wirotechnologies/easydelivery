//
//  NearestLocationUIViewController.swift
//  Sumo Japanese
//
//  Created by imac on 13/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit
import MapKit

struct infoRestaurant {
    var index = Int()
    var locationName = String()
    var firstPartAddress = String()
    var secondPartAddress = String()
    var waitTime = String()
}

class NearestLocationUIViewController: UIMenuViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var heightOfContent: NSLayoutConstraint!
    @IBOutlet weak var scrollViewScene: UIScrollView!
    @IBOutlet weak var contentViewOfScroll: UIView!
    @IBOutlet weak var tableNearestLocation: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapNearestLocation: MKMapView!
    
    var nearestLocation = [infoRestaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "NearestTableViewCell", bundle: nil)
        tableNearestLocation.register(cellNib, forCellReuseIdentifier: "_nearestTableViewCell")
        
        nearestLocation = [
        infoRestaurant(index: 1, locationName: "Coral Springs", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "No Wait!"),
        infoRestaurant(index: 2, locationName: "Coral Springs", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "5 min!"),
        infoRestaurant(index: 3, locationName: "Swit Doral", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "8 min!"),
        infoRestaurant(index: 4, locationName: "Atlantic City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "20 min!"),
        infoRestaurant(index: 5, locationName: "Atlantic City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "20 min!"),
        infoRestaurant(index: 6, locationName: "Atlantic City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "20 min!"),
        infoRestaurant(index: 7, locationName: "Hill Valley", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "30 min!"),
        infoRestaurant(index: 8, locationName: "Hill Valley", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "35 min!"),
        infoRestaurant(index: 9, locationName: "Hill Valley", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "35 min!"),
        infoRestaurant(index: 10, locationName: "Hill Valley", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "40 min!"),
        infoRestaurant(index: 11, locationName: "New York City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "50 min!"),
        infoRestaurant(index: 12, locationName: "New York City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "50 min!"),
        infoRestaurant(index: 13, locationName: "New York City", firstPartAddress: "1555 University DR", secondPartAddress: "Coral Springs", waitTime: "50 min!")
        ]
        heightOfContent.constant += CGFloat(123 * nearestLocation.count)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearestLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "_nearestTableViewCell") as? NearestTableViewCell
        cell?.setLabels(text: String(nearestLocation[indexPath.row].index), label: 0)
        cell?.setLabels(text: String(nearestLocation[indexPath.row].locationName), label: 1)
        cell?.setLabels(text: String(nearestLocation[indexPath.row].firstPartAddress), label: 2)
        cell?.setLabels(text: String(nearestLocation[indexPath.row].secondPartAddress), label: 3)
        cell?.setLabels(text: String(nearestLocation[indexPath.row].waitTime), label: 4)
        return (cell!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueFormNearestToRestaurantDetails", sender: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("acá realizas tu búsqueda")
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchBar.text
        
                let activeSearch = MKLocalSearch(request: searchRequest)
                activeSearch.start{(response, error) in
                    
                    //activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    if response == nil
                    {
                        print("error")
                    } else {
                        //remove the anotations
                        let annotations = self.mapNearestLocation.annotations
                        self.mapNearestLocation.removeAnnotations(annotations)
                        //getting the data
                        let latitude = response?.boundingRegion.center.latitude
                        let longitude = response?.boundingRegion.center.longitude
                        //create anotation
                        let annotation = MKPointAnnotation()
                        annotation.title = searchBar.text
                        annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                        self.mapNearestLocation.addAnnotation(annotation)
                        //zomming in on annotation
                        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                        let region = MKCoordinateRegion(center: coordinate, span: span)
                        self.mapNearestLocation.setRegion(region, animated: true)
                    }
        
                }
    }
    //cerrar el teclado al hacer touch


    
}
