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

extension ShortsTableViewCell: UICollectionViewDelegate{}

extension ShortsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HomeFeedViewController.videosRes.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shortsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shortsCollectionViewCell", for: indexPath) as! ShortsCollectionViewCell
        shortsCell.ShortsThumbnailmageViewer.image = UIImage(named: HomeFeedViewController.videosRes.videos[indexPath.row].thumbnail)
        
        return shortsCell
    }
    
    
}
