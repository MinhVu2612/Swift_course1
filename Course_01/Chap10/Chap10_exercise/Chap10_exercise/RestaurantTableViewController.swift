//
//  RestaurantTableViewController.swift
//  Chap10_exercise
//
//  Created by Vũ Nguyễn on 2/25/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantName = ["Cafe Deadend", "Homei", "Teakha",
    "Cafe Loisl", "Petite oyster", "For Kee Restaurant",
    "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
    "Palomino Espresso","Upstate", "Traif", "Graham Avenue Meats",
    "Waffle & Wolf", "Five leaves", "Cafe Lore", "Confessional",
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
    
    var restaurantIsFavorite = Array(repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantName, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)

    }
    
    enum Section{
        case all
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String>{
        let cellIdendtifier = "datacell0"
        let dataSource = UITableViewDiffableDataSource<Section, String>(
        tableView: tableView,
        cellProvider: { tableView, indexPath, restaurantName in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdendtifier, for: indexPath) as! RestaurantTableViewCell
            
            cell.nameLabel.text = restaurantName
            cell.LocationLabel.text = self.restaurantLocation[indexPath.row]
            cell.typeLabel.text = self.restaurantType[indexPath.row]
            cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
            cell.accessoryType = self.restaurantIsFavorite[indexPath.row] ? .checkmark : .none
            
            return cell
            }
        
        )
        return dataSource
    }
    
    lazy var dataSource = configureDataSource()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // creat a option menu
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // add action to menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // add mark as favorite action
        let favoriteTitle = restaurantIsFavorite[indexPath.row] ? "Remove from favorites" : "Mark as favorite"
        let favoriteAction = UIAlertAction(title: favoriteTitle, style: .default, handler: {
            (action: UIAlertAction) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            cell?.accessoryType = self.restaurantIsFavorite[indexPath.row] ? .none : .checkmark
            
            self.restaurantIsFavorite[indexPath.row] = self.restaurantIsFavorite[indexPath.row] ? false : true
        })
        optionMenu.addAction(favoriteAction)
        
        // add reserve table action
        let reserveHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Not available yet!", message: "Please try later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let reserveAction = UIAlertAction(title: "Reverve a table", style: .default, handler: reserveHandler)
        optionMenu.addAction(reserveAction)
        
        // display the menu
        present(optionMenu, animated: true, completion: nil)
        
        // unselect the cell
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
