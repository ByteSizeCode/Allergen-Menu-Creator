//
//  DetailsVC.swift
//  Allergy Menu
//
//  Created by Isaac Raval on 4/21/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

//TODO: create imageview programatically and label programatically. Create allergy menu sheet. Implement share functionality and share as PDF to all sources shown in share sheet.

import UIKit

class DetailsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var containsGluten: UISegmentedControl!
    @IBOutlet weak var containsSoy: UISegmentedControl!
    @IBOutlet weak var containsDairy: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doneButton(_ sender: UIButton) {
        
        //Get properties
        let title = itemName.text ?? "Not Specified" //If not enterd, set to Not Specified
        let gluten: Bool = (containsGluten.titleForSegment(at: containsGluten.selectedSegmentIndex) == "Yes" ? true : false) //if "Yes" selected- true, else false
        let soy: Bool = (containsSoy.titleForSegment(at: containsSoy.selectedSegmentIndex) == "Yes" ? true : false)
        let dairy: Bool = (containsDairy.titleForSegment(at: containsDairy.selectedSegmentIndex) == "Yes" ? true : false)
        
        //Create string for cell subtitle
        var allergenList = "";
        if(gluten) {
            allergenList += "Gluten, "
        }
        if(soy) {
            allergenList += "Soy, "
        }
        if(dairy) {
            allergenList += "Dairy, "
        }
        
        //Remove extra comma and space from end
        if(allergenList.count > 2) {
            allergenList.popLast()
            allergenList.popLast()
        }
        
        //If no allergens, set value to indicate such
        if(allergenList.count == 0) {
            allergenList += "No allergens"
        }
        
        //Create object and add to Menu
        AppDelegate.menu.append(Item(title: title, containsGluten: gluten, containsSoy: soy, containsDairy: dairy, fullListAllergens: allergenList))
        
        
        //Go back to previous view controller
        dismiss(animated: true, completion: nil)
    }
}
