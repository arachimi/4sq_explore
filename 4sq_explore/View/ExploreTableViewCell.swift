//
//  ExploreTableViewCell.swift
//  4sq_explore
//
//  Created by Macbook on 19/1/2564 BE.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var lblPlaceAddress: UILabel!
    static let identifier = "exploreTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


