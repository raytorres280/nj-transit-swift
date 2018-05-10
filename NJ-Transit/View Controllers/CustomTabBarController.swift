//
//  CustomTabBarController.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/10/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var homeNavigationController: UINavigationController = UINavigationController(rootViewController: HomeController())
    var ticketsNavigationController: UINavigationController = UINavigationController(rootViewController: TicketsController())
    var dvNavigationController: UINavigationController = UINavigationController(rootViewController: DepartureVisionController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeNavigationController, ticketsNavigationController, dvNavigationController]
        setupTabBar()
    }

    private func setupTabBar() -> Void {
        homeNavigationController.tabBarItem.image = UIImage.init(named: "icons8-timetable")
        homeNavigationController.tabBarItem.title = "Schedule/Buy"
        ticketsNavigationController.tabBarItem.image = UIImage.init(named: "icons8-ticket")
        ticketsNavigationController.tabBarItem.title = "MyTix"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
