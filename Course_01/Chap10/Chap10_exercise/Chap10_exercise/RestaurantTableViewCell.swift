//
//  RestaurantTableViewCell.swift
//  Chap10_exercise
//
//  Created by Vũ Nguyễn on 2/25/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var LocationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!{
        didSet{
            thumbnailImageView.layer.cornerRadius = 30.0
            thumbnailImageView.clipsToBounds = true
        }
    }

}
