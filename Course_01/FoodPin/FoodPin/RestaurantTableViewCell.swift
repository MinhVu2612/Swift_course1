//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Vũ Nguyễn on 2/19/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.tintColor = .systemRed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heartImage: UIImageView!
    @IBOutlet var thumbnailImageView: UIImageView!{
        didSet{
            thumbnailImageView.layer.cornerRadius = 20.0
            
            thumbnailImageView.clipsToBounds = true
        }
    }

}
