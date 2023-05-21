//
//  HomeFeedViewController.swift
//  mytube
//

//  Created by subrata Samartha on 18/05/23.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var videosTableView: UITableView!
    var videosRes:VideosModel = VideosModel(videos: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let videoCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        videosTableView.register(videoCellNib, forCellReuseIdentifier: "videoCell")
        
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
            self.videosRes = videos
        }
    }

}

extension HomeFeedViewController: UITableViewDelegate {}

extension HomeFeedViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosRes.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideosTableViewCell
        
        videoCell.videoTitleLabel.text = videosRes.videos[indexPath.row].title
        videoCell.tumbnailImageView.image = UIImage(named: videosRes.videos[indexPath.row].thumbnail)
        videoCell.channelPicImageViw.image = UIImage(named: videosRes.videos[indexPath.row].profilePic)
        videoCell.channelNameLabel.text = videosRes.videos[indexPath.row].channelName
        videoCell.viewCountLabel.text = videosRes.videos[indexPath.row].views
        videoCell.timeStatmpLabel.text = videosRes.videos[indexPath.row].timeStamp
        
        return videoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let videoPlayVC = Storyboard.instantiateViewController(withIdentifier: "videoPlayVC") as! VideoPlayViewController
    
        videoPlayVC.videoDictionary["title"] = videosRes.videos[indexPath.row].title
        videoPlayVC.videoDictionary["thumbnail"] = videosRes.videos[indexPath.row].thumbnail
        videoPlayVC.videoDictionary["channelName"] = videosRes.videos[indexPath.row].channelName
        videoPlayVC.videoDictionary["profilePic"] = videosRes.videos[indexPath.row].profilePic
        videoPlayVC.videoDictionary["views"] = videosRes.videos[indexPath.row].views
        videoPlayVC.videoDictionary["timeStamp"] = videosRes.videos[indexPath.row].timeStamp
        
        
        self.navigationController?.pushViewController(videoPlayVC, animated: true)
    }
}
