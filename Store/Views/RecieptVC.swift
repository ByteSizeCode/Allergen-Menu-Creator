//
//  RecieptVC.swift
//  Store
//
//  Created by Isaac Raval on 4/19/19.
//  Copyright © 2019 organization. All rights reserved.
//

//Description: Reciept is displayed when user submits list

import UIKit

class RecieptVC: UIViewController {
    
    let EMPTY = 0
    var totalPrice = 0.0
    
    @IBOutlet weak var reciept: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Fetch all items purchased format them, and include their price
        var purchesFormatted = ""
        for element in AppDelegate.shoppingList {
            var numCharsInTitle = element.title.count
            purchesFormatted += "\(element.title) \(String(repeating: " ", count: (40 % numCharsInTitle)))$\(element.price)\n\n"
            //Summ all prices seen as well
            totalPrice += element.price
        }
        
        //Round total
        let roundedTotal = String(format: "%.2f", totalPrice)
        
        if(AppDelegate.shoppingList.count > EMPTY) {
            reciept.text =  """
                                The Store
            
            \(purchesFormatted)
                                        ---------
                                Total: $\(roundedTotal)
            
            """
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        //Go back to previous view controller
        dismiss(animated: true, completion: nil)
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
