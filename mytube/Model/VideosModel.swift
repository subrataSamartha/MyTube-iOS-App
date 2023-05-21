struct VideosModel: Decodable {
    let videos:[video]
}

struct video: Decodable {
    let title: String
    let thumbnail: String
    let channelName: String
    let profilePic: String
    let views: String
    let timeStamp: String
}
