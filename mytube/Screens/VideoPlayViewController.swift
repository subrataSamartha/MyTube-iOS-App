//
//  VideoPlayViewController.swift
//  mytube
//
//  Created by subrata Samartha on 18/05/23.
//

import UIKit

class VideoPlayViewController: UIViewController {
    
    @IBOutlet weak var videosTableView: UITableView!
    
    var videoOnPlayer: video = video(id: Int(), title: String(), thumbnail: String(), channelName: String(), profilePic: String(), views: String(), timeStamp: String(), liked: Bool(), likeCount: Int(), disliked: Bool(), subscribe: Bool())
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var subscribeButton: UIButton!
    
    
    
//    var videosRes:VideosModel = HomeFeedViewController.videosRes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let videoCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        videosTableView.register(videoCellNib, forCellReuseIdentifier: "videoCell")
    
        videoTitleLabel.text = videoOnPlayer.title
        thumbnailImageView.image = UIImage(named: videoOnPlayer.thumbnail)
        channelNameLabel.text = videoOnPlayer.channelName
        profilePicImageView.image = UIImage(named: videoOnPlayer.profilePic)
        viewsLabel.text = (videoOnPlayer.views) + " views"
        timeStampLabel.text = "uploaded " + videoOnPlayer.timeStamp
        if(videoOnPlayer.liked) {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsUpImage = UIImage(systemName: "hand.thumbsup.fill", withConfiguration: smallConfig)
            likeButton.setImage(filledThumbsUpImage, for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown", withConfiguration: smallConfig), for: .normal)
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
        } else {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsUpImage = UIImage(systemName: "hand.thumbsup", withConfiguration: smallConfig)
            likeButton.setImage(filledThumbsUpImage, for: .normal)
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
        }
        
        if(videoOnPlayer.disliked) {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsDownImage = UIImage(systemName: "hand.thumbsdown.fill", withConfiguration: smallConfig)
            dislikeButton.setImage(filledThumbsDownImage, for: .normal)
            likeButton.setImage(UIImage(systemName: "hand.thumbsup", withConfiguration: smallConfig), for: .normal)
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
            
        } else {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let ThumbsDownImage = UIImage(systemName: "hand.thumbsdown", withConfiguration: smallConfig)
            dislikeButton.setImage(ThumbsDownImage, for: .normal)
        }
        
        if(videoOnPlayer.subscribe) {
            let attributedText = NSAttributedString(string: "Subscribed", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 14) as Any])
            subscribeButton.setAttributedTitle(attributedText, for: .normal)
        } else {
            let attributedText = NSAttributedString(string: "Subscribe", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 14) as Any])
            subscribeButton.setAttributedTitle(attributedText, for: .normal)
        }
        
        
    }
    

    //MARK: Button Actions
    @IBAction func doLikeVideo(_ sender: Any) {
        videoOnPlayer.liked.toggle()
        
        if(videoOnPlayer.liked) {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsUpImage = UIImage(systemName: "hand.thumbsup.fill", withConfiguration: smallConfig)
            likeButton.setImage(filledThumbsUpImage, for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown", withConfiguration: smallConfig), for: .normal)
            videoOnPlayer.likeCount = videoOnPlayer.likeCount + 1
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
            
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].liked = true;
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].disliked = false;
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].likeCount = videoOnPlayer.likeCount
            
            
        } else {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsUpImage = UIImage(systemName: "hand.thumbsup", withConfiguration: smallConfig)
            likeButton.setImage(filledThumbsUpImage, for: .normal)
            videoOnPlayer.likeCount = videoOnPlayer.likeCount - 1
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
            
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].liked = false;
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].likeCount = videoOnPlayer.likeCount
        }
        
                
    }
    @IBAction func doDislikeVideo(_ sender: Any) {
        videoOnPlayer.disliked.toggle()
        
        if(videoOnPlayer.disliked) {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsDownImage = UIImage(systemName: "hand.thumbsdown.fill", withConfiguration: smallConfig)
            dislikeButton.setImage(filledThumbsDownImage, for: .normal)
            likeButton.setImage(UIImage(systemName: "hand.thumbsup", withConfiguration: smallConfig), for: .normal)
            videoOnPlayer.liked ? videoOnPlayer.likeCount = videoOnPlayer.likeCount - 1 : nil
            likeButton.setTitle(String(videoOnPlayer.likeCount), for: .normal)
            videoOnPlayer.liked = false
            
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].liked = false;
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].disliked = true;
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].likeCount = videoOnPlayer.likeCount
        } else {
            let smallConfig = UIImage.SymbolConfiguration(scale: .small)
            let filledThumbsDownImage = UIImage(systemName: "hand.thumbsdown", withConfiguration: smallConfig)
            dislikeButton.setImage(filledThumbsDownImage, for: .normal)
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].disliked = false;
        }
    }
    
    @IBAction func doSubscribe(_ sender: Any) {
        videoOnPlayer.subscribe.toggle()
        
        if(videoOnPlayer.subscribe) {
            let attributedText = NSAttributedString(string: "Subscribed", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 14) as Any])
            subscribeButton.setAttributedTitle(attributedText, for: .normal)
//            subscribeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].subscribe = true
            UserData.shared.locallyStoredVideoAtributes.append(["subscription":true,
                                                               ])
            UserData.shared.updateVideoAttributeInUserData()
                        
            
        } else {
            let attributedText = NSAttributedString(string: "Subscribe", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 14) as Any])
            subscribeButton.setAttributedTitle(attributedText, for: .normal)
//          subscribeButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            HomeFeedViewController.videosRes.videos[videoOnPlayer.id].subscribe = false
        }
    }
}

extension VideoPlayViewController: UITableViewDelegate {}

extension VideoPlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeFeedViewController.videosRes.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideosTableViewCell
        
        videoCell.videoTitleLabel.text = HomeFeedViewController.videosRes.videos[indexPath.row].title
        videoCell.tumbnailImageView.image = UIImage(named: HomeFeedViewController.videosRes.videos[indexPath.row].thumbnail)
        videoCell.channelPicImageViw.image = UIImage(named: HomeFeedViewController.videosRes.videos[indexPath.row].profilePic)
        videoCell.channelNameLabel.text = HomeFeedViewController.videosRes.videos[indexPath.row].channelName
        videoCell.viewCountLabel.text = HomeFeedViewController.videosRes.videos[indexPath.row].views
        videoCell.timeStatmpLabel.text = HomeFeedViewController.videosRes.videos[indexPath.row].timeStamp
        
        return videoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let videoPlayVC = Storyboard.instantiateViewController(withIdentifier: "videoPlayVC") as! VideoPlayViewController
    
        videoPlayVC.videoOnPlayer = HomeFeedViewController.videosRes.videos[indexPath.row]
        
        self.navigationController?.pushViewController(videoPlayVC, animated: true)
    }
    
}
