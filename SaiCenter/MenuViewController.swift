//
//  MenuViewController.swift
//  SaiCenter
//
//  Created by Sabareesh Kappagantu on 9/2/18.
//  Copyright © 2018 Sabareesh Kappagantu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var menuTableView: UITableView!
    
    private var homeViewController: UIViewController!
    private var profileViewController: UIViewController!
    private var settingsViewController: UIViewController!
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        viewControllers.append(homeViewController)
        viewControllers.append(profileViewController)
        viewControllers.append(settingsViewController)
        
        menuTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let menuTitles = ["Home", "Profile", "Settings"]
        
        cell.menuLabel.text = menuTitles[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
