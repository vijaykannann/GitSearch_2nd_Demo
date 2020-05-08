//
//  ListCell.swift
//  GithubDemo
//
//  Created by varun on 06/05/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var lblStar: UILabel!
    
    @IBOutlet weak var lblFork: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var imgName: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewBG: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CommonUnit.sharedInstance.setBorderAndCorner(imgName, 0.0, .clear, 25.0)
        self.viewBG.setShadow(radiusType: .all, cornerRadius: 8.0, shadowRadius: 3.0, opacity: 0.2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
