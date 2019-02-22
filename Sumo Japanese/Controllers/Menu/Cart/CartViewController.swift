//
//  CartViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/29/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit



class CartViewController: UIMenuViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBAction func checkoutButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToCheckoutView", sender: nil)
    }
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var StackLocation: UIStackView!
    @IBOutlet weak var StackTime: UIStackView!
    
    var itemsList = ["item 1", "item 2", "item 3", "item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController
        //binding cell for the category
        let cellNib = UINib(nibName: "ItemCartViewCell", bundle: nil)
        itemTableView.register(cellNib, forCellReuseIdentifier: "itemCartViewCell_")
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(tapHandler))
        tap.minimumPressDuration = 0
        StackLocation.addGestureRecognizer(tap)
        let tapTime = UILongPressGestureRecognizer(target: self, action: #selector(tapHandlerTime))
        tapTime.minimumPressDuration = 0
        StackTime.addGestureRecognizer(tapTime)

    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCartViewCell_") as? ItemCartViewCell
        cell?.setTitle(title: self.itemsList[indexPath.row])
        return (cell!)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           guard editingStyle == .delete else { return }
        self.itemsList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)

    }
    
//Begin Swipe function
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, important])
    }
    
    func importantAction(at indexPath: IndexPath) -> UIContextualAction {
       // let todo = itemsList[indexPath.row]
        let action = UIContextualAction(style:.normal, title: nil){(action, view, completion) in
            completion(true)
        }
        action.backgroundColor = UIColor(patternImage: UIImage(named: "icon_hack_double")!)
//        action.image = #imageLiteral(resourceName: "icon_duplicate_trash")
//        action.backgroundColor =
//            UIColor(red:0.58, green:0.75, blue:0.00, alpha:1.0)
        return action
        
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: nil){(action, view, completion) in
            self.itemsList.remove(at: indexPath.row)
            //self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = UIColor(patternImage: UIImage(named: "icon_hack_remove")!)
//        action.image = #imageLiteral(resourceName: "icon_trash_line")
//        action.backgroundColor = UIColor(red:0.81, green:0.03, blue:0.08, alpha:1.0)
        return action
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToCheckoutItem", sender: nil)
    }
//End Swipe function
    @objc func tapHandler(gesture: UITapGestureRecognizer) {
        if gesture.state == .began {
            performSegue(withIdentifier: "segueFromCartViewToNearestLocation", sender: nil)
        }
    }
    @objc func tapHandlerTime(gesture: UITapGestureRecognizer) {
        if gesture.state == .began {
            performSegue(withIdentifier: "segueToPickupTimeFromCart", sender: nil)
        }
    }

}
