//
//  AddScreenVC.swift
//  Alergy Menu
//
//  Created by Isaac Raval on 4/21/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class AddScreen: UIViewController {
    
    var selectedCell: IndexPath = []
    var items = [Item]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = AppDelegate.menu

        tableView.reloadData()
    }
}

extension AddScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        
        //Set cell title
        cell.textLabel?.text = item.title
        //Set cell subtitle
        cell.detailTextLabel?.text = item.fullListAllergens
        
//        cell.setStoreItem(storeItem: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell from list selected: \(indexPath.row)")
        selectedCell = indexPath
        
        //Animate highlight and unhighlight of cell tapped
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Enable slide to delete on cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Remove from array
            AppDelegate.menu.remove(at: indexPath.row)
            items.remove(at: indexPath.row)
            //Remove cell
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
