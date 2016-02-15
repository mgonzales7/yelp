//
//  BusinessCell.swift
//  Yelp
//
//  Created by Michael Gonzales on 2/11/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    var business: Business!{
        didSet {
            mainLabel.text = business.name
            thumbImage.setImageWithURL(business.imageURL!)
            foodLabel.text = business.categories
            addressLabel.text = business.address
            reviews.text = "\(business.reviewCount!) Reviews"
            ratingImage.setImageWithURL(business.ratingImageURL!)
            distanceLabel.text = business.distance
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.preferredMaxLayoutWidth = mainLabel.frame.size.width
        // Initialization code
    }
    
    override func layoutSubviews(){
            super.layoutSubviews()
            mainLabel.preferredMaxLayoutWidth = mainLabel.frame.size.width
    
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
