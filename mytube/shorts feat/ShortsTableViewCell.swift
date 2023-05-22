//
//  ShortsTableViewCell.swift
//  mytube
//
//  Created by subrata Samartha on 25/05/23.
//

import UIKit

class ShortsTableViewCell: UITableViewCell {

    @IBOutlet weak var shortsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
