//
//  ViewController.swift
//  SimpleTable
//
//  Created by Vũ Nguyễn on 2/19/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster",
    "For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate",
    "Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli",
    "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina","Donostia",
    "Royal Oak", "CASK Pub and Kitchen"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count // return the number of rows in the section.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // configure the cell..
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        return false
    }


}


