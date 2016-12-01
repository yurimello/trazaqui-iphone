//
//  TableViewController.swift
//  trazaqui-iphone
//
//  Created by Yuri Mello on 30/11/16.
//  Copyright © 2016 Yuri Mello. All rights reserved.
//

import SwiftyJSON
import UIKit

class TableViewController: UITableViewController {
    
    var labels: [String] = []
    var children: [JSON] = []
    
    func addJSONObject(_ jsonObject: JSON, labelName: String){
        self.labels.append(jsonObject[labelName].string!)
    }
    
    func addJSONObject(_ jsonObject: JSON, labelName: String, childName: String){
        self.labels.append(jsonObject[labelName].string!)
        self.children.append(jsonObject[childName])
    }
    
    func resetData(){
        self.labels = []
        self.children = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.labels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.labels[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCell(indexPath: indexPath)
    }
    
    func selectCell(indexPath: IndexPath){}
    
    func showTable(_ navigationController: UINavigationController?){
        self.tableView.reloadData()
        navigationController?.pushViewController(self, animated: true)
    }
        
    func showChildTable(_ childController: TableViewController){
        childController.tableView.reloadData()
        self.navigationController?.pushViewController(childController, animated: true)
    }
    
    func processChildren(indexPath: IndexPath){}
    
}
