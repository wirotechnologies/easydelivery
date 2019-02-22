//
//  RemoveIngredientsViewController.swift
//  Sumo Japanese
//
//  Created by imac on 28/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit



class RemoveIngredientsViewController: UIMenuViewController, UITableViewDelegate, UITableViewDataSource, RemoveCellDelegate{
    
    func setSwitchState(state: Bool, name: Int, section: Int) {
        tableViewData[section].sectionData[name].selected = state
        print(tableViewData)
    }
    
    @IBAction func saveRemovedIngredients(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var removeTableView: UITableView!
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemsNumBadge()
        let cellNib = UINib(nibName: "RemoveViewCell", bundle: nil)
        removeTableView.register(cellNib, forCellReuseIdentifier: "removeViewCell")
        let cellNibContent = UINib(nibName: "RemoveViewCellContent", bundle: nil)
        removeTableView.register(cellNibContent, forCellReuseIdentifier: "removeViewCellContent")
        
        tableViewData = [
            cellData(opened: false, title: "Vegetables", sectionData: [
                itemIngredientCell(selected:  true, itemName: "Vegetable 1"),
                itemIngredientCell(selected:  true, itemName: "Vegetable 2"),
                itemIngredientCell(selected: true, itemName: "Vegetable 3")
                ]),
            cellData(opened: false, title: "Proteins", sectionData: [
                itemIngredientCell(selected:true, itemName:"Protein 1"),
                itemIngredientCell(selected:true, itemName:"Protein 2")
                ]),
            cellData(opened: false, title: "Sauces", sectionData: [
                itemIngredientCell(selected:true, itemName:"Sauce 1"),
                itemIngredientCell(selected:true, itemName:"Sauce 2"),
                itemIngredientCell(selected:true, itemName:"Sauce 3")
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
            let cell =  tableView.dequeueReusableCell(withIdentifier: "removeViewCell") as? RemoveViewCell
            let cellContent =  tableView.dequeueReusableCell(withIdentifier: "removeViewCellContent") as? RemoveViewCellContent
            let indexContent = indexPath.row - 1
            
            cellContent?.delegate = self
            
            if indexPath.row == 0 {
                //cell for the category
                cell?.setLabel(text: tableViewData[indexPath.section].title)// = tableViewData[indexPath.section].title
                return (cell!)
            } else {
                //cell for the content
                cellContent?.setLabel(text: tableViewData[indexPath.section].sectionData[indexContent].itemName)
                cellContent?.setSwitch(state: tableViewData[indexPath.section].sectionData[indexContent].selected)
                cellContent?.index = indexPath
                return (cellContent!)
            }
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath) {
            let cellContent =  tableView.dequeueReusableCell(withIdentifier: "additionViewCellContent") as? AdditionViewCellContent
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
                //cellContent?.showCheck(selected: true)
            }
        }
        
 
}
