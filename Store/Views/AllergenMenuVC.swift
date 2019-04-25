//
//  AllergenMenuVC.swift
//  Alergy Menu
//
//  Created by Isaac Raval on 4/21/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class AllergenMenuVC: UIViewController, UIScrollViewDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Various setup and cleanup
        setupView()
        
        //Loop through menu and add to view
        for element in AppDelegate.menu {
            resetIconX()
            //Create label
            createItemLabel(name: element.title)
            //Add relevant allergen indicator icons to the view
            if(element.containsGluten) {
                addAllergenIndicatorFor(name: "Gluten")
            }
            if(element.containsDairy) {
                addAllergenIndicatorFor(name: "Dairy")
            }
            if(element.containsSoy) {
                addAllergenIndicatorFor(name: "Soy")
            }
        }
    
    }
    
    func createItemLabel (name:String) {
        AppDelegate.labeyYPrev += 100 //Increment label y location for next label
        let x = AppDelegate.labelX
        let y = AppDelegate.labeyYPrev
        let label = UILabel(frame: .zero)
        
        //Enable text wrapping (for max 3 line)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        
        label.text = name;
        label.frame = CGRect(x: x, y: y, width: 100, height: 100)
        self.view.addSubview(label)
    }
    
    func addAllergenIndicatorFor (name:String) {
        let x = AppDelegate.iconXPrev + (3 * name.count) //Move as length of label increases
        let y = AppDelegate.labeyYPrev
        //Increment icon x location for next icon
        AppDelegate.iconXPrev += 100
        let imageName = "\(name).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: x, y: y, width: 70, height: 90)
        view.addSubview(imageView)
    }
    
    func resetIconX() {
        AppDelegate.iconXPrev = 80
    }
    
    func setupView() {
        let IGNORE_WELCOME_LABELS = 3
        //Remove all previous content from view
        for (index, i) in view.subviews.enumerated() {
            if(index < IGNORE_WELCOME_LABELS) {continue} //Do not delete the two welcome labels
            i.removeFromSuperview()
        }
        
        //Reset coordinate values
        AppDelegate.labeyYPrev = 50 //Coordinates of previous label
        AppDelegate.iconYPrev = 150 //Coordinates of previous allergen label
    }
}
