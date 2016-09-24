//
//  FeedCell.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 9/18/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import UIKit
import DateTools

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    private let USER_IMAGE_SIZE:CGFloat = 35
    
    private let service = Services.sharedInstance
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.backgroundColor = UIColor.init(rgba: "#EEEEEE")
        photoImageView.backgroundColor = UIColor.init(rgba: "#EEEEEE")
        userImageView.layer.cornerRadius = USER_IMAGE_SIZE/2
        userImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item: Item) {
        userLabel.text = item.username ?? ""
        locationLabel.text = item.location ?? ""
        contentLabel.text = item.caption ?? ""
        likeLabel.text = "♥ \(item.likes ?? 0)"
        
        if let date = item.datetime {
            dateTimeLabel.text = (date as NSDate).timeAgoSinceNow()
        }
        
        if let avatar = item.avatar {
            service.getImage(imageUrl: avatar,
                downloadProgress: { (progress) in
                    print(progress)
                }) { (image, error) in
                    self.userImageView.image = image
                }
        }
        
        if let avatar = item.imageUrl {
            service.getImage(imageUrl: avatar,
                downloadProgress: { (progress) in
                    print(progress)
                }) { (image, error) in
                    self.photoImageView.image = image
                }
        }
        
    }

}
