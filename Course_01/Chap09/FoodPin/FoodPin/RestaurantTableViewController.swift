//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Vũ Nguyễn on 2/19/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha",
    "Cafe Loisl", "Petite Oyster", "For Kee Restaurant",
    "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
    "Palomino Espresso","Upstate", "Traif", "Graham Avenue Meats",
    "Waffle & wolf", "Five Leaves", "Cafe Lore", "Confessional" ,
    "Barrafina","Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha",
    "cafeloisl", "petiteoyster", "forkee",
    "posatelier", "bourkestreetbakery", "haigh",
    "palomino", "upstate", "traif", "graham",
    "waffleandwolf", "fiveleaves", "cafelore", "confessional",
    "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocation = ["Hong Kong", "Hong Kong", "Hong Kong",
    "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney",
    "Sydney", "Newyork", "Newyork", "Newyork", "Newyork", "Newyork", "Newyork",
    "Newyork", "Newyork", "London", "London", "London", "London"]
    
    var restaurantType = ["Coffe & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink",
    "French", "Bakery", "Bakery", "Chocolate" ,"Cafe", "American/ Seafood", "American",
    "American","Breakfadt & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish",
    "Spanish", "Spanish", "British","Thai"]
    
    enum Section {
        case all
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String>{
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section,String>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurantNames in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
                
                cell.nameLabel.text = restaurantNames 
                cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
                cell.locationLabel.text = self.restaurantLocation[indexPath.row]
                cell.typeLabel.text = self.restaurantType[indexPath.row]
                
                
                return cell
            }
        )
        
        return dataSource
    }
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // add action to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // display the menu
        present(optionMenu, animated: true, completion: nil)
        
    }
    
} // RestaurantTableViewController class
