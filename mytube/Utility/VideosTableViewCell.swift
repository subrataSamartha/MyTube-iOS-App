//
//  VideosTableViewCell.swift
//  mytube
//
//  Created by subrata Samartha on 18/05/23.
//

import UIKit

class VideosTableViewCell: UITableViewCell {

    @IBOutlet weak var tumbnailImageView: UIImageView!
    @IBOutlet weak var channelPicImageViw: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var timeStatmpLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
