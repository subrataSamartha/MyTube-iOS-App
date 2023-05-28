//
//  DiscoverTableViewCell.swift
//  mytube
//
//  Created by subrata Samartha on 24/05/23.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var discoveryCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DiscoverTableViewCell: UICollectionViewDelegate {}

extension DiscoverTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DiscoveryData.discoveryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoveryCollectionViewCell", for: indexPath) as! DiscoveryCollectionViewCell
        discoverCell.discoveryLabel.text = DiscoveryData.discoveryData[indexPath.row]
        
        return discoverCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(DiscoveryData.discoveryData[indexPath.row])
        let filterKey = DiscoveryData.discoveryData[indexPath.row]
        HomeFeedViewController.filterContentForHomeFeed(filterKey: filterKey.lowercased())
//        print(type(of: filterKey))
        
    }
    
    
}
