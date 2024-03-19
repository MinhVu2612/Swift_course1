//
//  RestaurantTableViewController.swift
//  Chap09_exercise2
//
//  Created by Vũ Nguyễn on 2/20/24.
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
    
    enum Section{
        case all
    }
    
    func configureDataSoure() -> UITableViewDiffableDataSource<Section, String>{
        let indentifier = "datacell"
        let dataSource = UITableViewDiffableDataSource<Section,String>(
            tableView: tableView,
            cellProvider: {tableView, indexPath, restaurantNames in
                let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! RestaurantTableViewCell
                
                cell.nameLable.text = restaurantNames
                cell.locationLabel.text = self.restaurantLocation[indexPath.row]
                cell.typeLabel.text = self.restaurantType[indexPath.row]
                cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
                
                return cell
            
            }
        )
        
        return dataSource
    }
    
    lazy var dataSource = configureDataSoure()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)

    }

}
