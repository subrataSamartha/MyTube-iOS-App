//
//  HomeFeedViewController.swift
//  mytube
//
//  Created by subrata Samartha on 18/05/23.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var videosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let videoCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        videosTableView.register(videoCellNib, forCellReuseIdentifier: "videoCell")
        
    }

}

extension HomeFeedViewController: UITableViewDelegate {}

extension HomeFeedViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIData.videosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideosTableViewCell
        
        videoCell.videoTitleLabel.text = APIData.videosArray[indexPath.row]["title"]
        videoCell.tumbnailImageView.image = UIImage(named: APIData.videosArray[indexPath.row]["thumbnail"]!)
        videoCell.channelPicImageViw.image = UIImage(named: APIData.videosArray[indexPath.row]["profilePic"]!)
        videoCell.channelNameLabel.text = APIData.videosArray[indexPath.row]["channelName"]
        videoCell.viewCountLabel.text = APIData.videosArray[indexPath.row]["views"]
        videoCell.timeStatmpLabel.text = APIData.videosArray[indexPath.row]["timeStamp"]
        
        return videoCell
    }
}
