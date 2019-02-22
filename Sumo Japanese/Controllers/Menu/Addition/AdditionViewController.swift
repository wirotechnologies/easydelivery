//
//  AditionViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/16/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

struct itemIngredientCell {
    var selected = Bool()
    var itemName = String()
}

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [itemIngredientCell]()
}

class AdditionViewController: UIMenuViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func saveCustomizing(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        //performSegue(withIdentifier: "segueToFoodViewFromAdd", sender: self)
    }

    @IBOutlet weak var additionTableView: UITableView!
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemsNumBadge()
        let cellNib = UINib(nibName: "AdditionViewCell", bundle: nil)
        additionTableView.register(cellNib, forCellReuseIdentifier: "additionViewCell")
        let cellNibContent = UINib(nibName: "AdditionViewCellContent", bundle: nil)
        additionTableView.register(cellNibContent, forCellReuseIdentifier: "additionViewCellContent")
       
        tableViewData = [
            cellData(opened: false, title: "Vegetables", sectionData: [
                itemIngredientCell(selected:  false, itemName: "Vegetable 1"),
                itemIngredientCell(selected:  false, itemName: "Vegetable 2"),
                itemIngredientCell(selected: false, itemName: "Vegetable 3")
                ]),
            cellData(opened: false, title: "Proteins", sectionData: [
                itemIngredientCell(selected:false, itemName:"Protein 1"),
                itemIngredientCell(selected:false, itemName:"Protein 2")
                ]),
            cellData(opened: false, title: "Sauces", sectionData: [
                itemIngredientCell(selected:false, itemName:"Sauce 1"),
                itemIngredientCell(selected:false, itemName:"Sauce 2"),
                itemIngredientCell(selected:false, itemName:"Sauce 3")
                ])
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "additionViewCell") as? AdditionViewCell
        let cellContent =  tableView.dequeueReusableCell(withIdentifier: "additionViewCellContent") as? AdditionViewCellContent
        let indexContent = indexPath.row - 1
        if indexPath.row == 0 {
            //cell for the category
            cell?.setLabel(text: tableViewData[indexPath.section].title)// = tableViewData[indexPath.section].title
            return (cell!)
        } else {
            //cell for the content
            cellContent?.setLabel(text: tableViewData[indexPath.section].sectionData[indexContent].itemName)
            // con este mostrabas el check al hacer click cellContent?.showCheck(selected: tableViewData[indexPath.section].sectionData[indexContent].selected)
            return (cellContent!)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath) {
        let cellContent =  tableView.dequeueReusableCell(withIdentifier: "additionViewCellContent") as? AdditionViewCellContent
        let indexContent = indexPath.row - 1
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) //play animation
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
        } else {
            var selected = tableViewData[indexPath.section].sectionData[indexContent].selected
            tableViewData[indexPath.section].sectionData[indexContent].selected = !(selected)
            tableView.reloadData()
            print("recargó la tabla")
           // cellContent?.showCheck()
            
        }
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
