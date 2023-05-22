//
//  HomeFeedViewController.swift
//  mytube
//

//  Created by subrata Samartha on 18/05/23.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var videosTableView: UITableView!
    static var videosRes:VideosModel = VideosModel(videos: [])
    
    var filteredVideosRes = videosRes
    static var filterKey = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let videoCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        videosTableView.register(videoCellNib, forCellReuseIdentifier: "videoCell")
//        discoveryCollectionView.register(DiscoverTableViewCell.self, forCellWithReuseIdentifier: "discoveryCollectionViewCell")
//        shortsCollectionView.register(ShortsCollectionViewCell.self, forCellWithReuseIdentifier: "shortsCollectionViewCell")
        
        
        NetworkManager.shared.getVideos { videosData, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                return
            }
            
            guard let videos = videosData else {
                print("No data")
                return
            }
            
//            for video:VideosModel in videos {
//                print(video.title)
//            }
            HomeFeedViewController.videosRes = videos
        }
    }

}

extension HomeFeedViewController: UITableViewDelegate {}

extension HomeFeedViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeFeedViewController.videosRes.videos.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            RowFinder.atRow = indexPath.row
            let discoveryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "discoveryTableViewCell") as! DiscoverTableViewCell
            return discoveryTableViewCell
        } else if indexPath.row == 2 {
            RowFinder.atRow = indexPath.row
            let shortsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "shortsTableViewCell") as! ShortsTableViewCell
            return shortsTableViewCell
        } else if indexPath.row == 1 {
            let newIndexPath = indexPath.row - 1
            
            let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideosTableViewCell
            
            videoCell.videoTitleLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].title
            videoCell.tumbnailImageView.image = UIImage(named: HomeFeedViewController.videosRes.videos[newIndexPath].thumbnail)
            videoCell.channelPicImageViw.image = UIImage(named: HomeFeedViewController.videosRes.videos[newIndexPath].profilePic)
            videoCell.channelNameLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].channelName
            videoCell.viewCountLabel.text = HomeFeedViewController.videosRes.videos[indexPath.row].views
            videoCell.timeStatmpLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].timeStamp
            
            return videoCell
            
        } else {
            let newIndexPath = indexPath.row - 2
            
            let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideosTableViewCell
            
            videoCell.videoTitleLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].title
            videoCell.tumbnailImageView.image = UIImage(named: HomeFeedViewController.videosRes.videos[newIndexPath].thumbnail)
            videoCell.channelPicImageViw.image = UIImage(named: HomeFeedViewController.videosRes.videos[newIndexPath].profilePic)
            videoCell.channelNameLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].channelName
            videoCell.viewCountLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].views
            videoCell.timeStatmpLabel.text = HomeFeedViewController.videosRes.videos[newIndexPath].timeStamp
            
            return videoCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let videoPlayVC = Storyboard.instantiateViewController(withIdentifier: "videoPlayVC") as! VideoPlayViewController
            
            videoPlayVC.videoOnPlayer = HomeFeedViewController.videosRes.videos[indexPath.row - 1]
        
            
            self.navigationController?.pushViewController(videoPlayVC, animated: true)
        }
        if indexPath.row > 2 {
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let videoPlayVC = Storyboard.instantiateViewController(withIdentifier: "videoPlayVC") as! VideoPlayViewController
            
            videoPlayVC.videoOnPlayer = HomeFeedViewController.videosRes.videos[indexPath.row - 2]
        
            
            self.navigationController?.pushViewController(videoPlayVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            // Return the  height for discovery cell
            return 80
        } else if indexPath.row == 2 {
            // Return the height for shorts cell
            return 320
        } else {
            return 290
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Shorts"
//        } else {
//            return nil
//        }
//}
}
