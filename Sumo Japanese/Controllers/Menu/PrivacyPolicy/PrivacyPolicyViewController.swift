//
//  PrivacyPolicyViewController.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

struct textCategoryPolicy {
    var textContent = String()
}

struct cellTitleCategoryPrivacy {
    var opened = Bool()
    var title = String()
    var sectionData = [textCategoryPolicy]()
}

class PrivacyPolicyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableViewData = [cellTitleCategoryPrivacy]()
    
    @IBOutlet weak var privacyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "TitlePrivacyTableViewCell", bundle: nil)
        privacyTable.register(cellNib, forCellReuseIdentifier: "_titlePrivacyTableViewCell")
        let cellNibContent = UINib(nibName: "ContentPrivacyTableViewCell", bundle: nil)
        privacyTable.register(cellNibContent, forCellReuseIdentifier: "_contentPrivacyTableViewCell")
        
        tableViewData = [
            cellTitleCategoryPrivacy(opened: false, title: "Information We Collect", sectionData: [
                textCategoryPolicy(textContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                ]),
            cellTitleCategoryPrivacy(opened: false, title: "How We Use The Information We Obtain", sectionData: [
                textCategoryPolicy(textContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                ]),
            cellTitleCategoryPrivacy(opened: false, title: "Information We Share", sectionData: [
                textCategoryPolicy(textContent: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                ])
        ]
        print("entra acáaaaa")
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: "_titlePrivacyTableViewCell") as? TitlePrivacyTableViewCell
        let cellContent =  tableView.dequeueReusableCell(withIdentifier: "_contentPrivacyTableViewCell") as? ContentPrivacyTableViewCell
        let indexContent = indexPath.row - 1
        
        if indexPath.row == 0 {
            //cell for the category
            cell?.setCategory(text: tableViewData[indexPath.section].title)// = tableViewData[indexPath.section].title
            return (cell!)
        } else {
            //cell for the content
            cellContent?.setContent(text: tableViewData[indexPath.section].sectionData[0].textContent)
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
//            var selected = tableViewData[indexPath.section].sectionData[indexContent].selected
//            tableViewData[indexPath.section].sectionData[indexContent].selected = !(selected)
//            tableView.reloadData()
//            print("recargó la tabla")
            // cellContent?.showCheck()
            
        }
    }

}
