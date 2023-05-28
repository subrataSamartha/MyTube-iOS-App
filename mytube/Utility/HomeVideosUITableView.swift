//
//  HomeVideosUITableView.swift
//  mytube
//
//  Created by subrata Samartha on 24/05/23.
//

import UIKit

class HomeVideosUITableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

//extension HomeFeedViewController: UICollectionViewDelegate {}
//
//extension HomeFeedViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if RowFinder.atRow == 0 {
//            return DiscoveryData.discoveryData.count
//        } else {
//            return HomeFeedViewController.videosRes.videos.count
//        }
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//      
//        if RowFinder.atRow == 0 {
//            let discoverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoveryCollectionViewCell", for: indexPath) as! DiscoveryCollectionViewCell
//            discoverCell.discoveryLabel.text = DiscoveryData.discoveryData[indexPath.row]
//            
//            return discoverCell
//        } else {
//            let shortsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shortsCollectionViewCell", for: indexPath) as! ShortsCollectionViewCell
//            shortsCell.ShortsThumbnailmageViewer.image = UIImage(named: HomeFeedViewController.videosRes.videos[indexPath.row].thumbnail)
//            
//            return shortsCell
//        }
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//         if RowFinder.atRow == 0 {
//            print(DiscoveryData.discoveryData[indexPath.row])
//         }
//    }
//    
//    
//}
