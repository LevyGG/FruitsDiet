//
//  Home_VC.swift
//  FruitsDiet
//
//  Created by Levy on 2017/4/19.
//  Copyright © 2017年 Ravi Shankar. All rights reserved.
//

import UIKit

class Home_VC: UIViewController {

    var pageVC:HomePageScroll_VC?
    var menuVC:HomeControlMenu_VC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageVC?.setupFloatWithSize(size: (pageVC?.view.bounds.size)!)
        menuVC?.setupFloatWithSize(size: (menuVC?.view.bounds.size)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sbid_segueto_HomePageScroll_VC" {
            pageVC = segue.destination as? HomePageScroll_VC
        }
        if segue.identifier == "sbid_segueto_HomeControlMenu_VC" {
            menuVC = segue.destination as? HomeControlMenu_VC
        }
    }
}
