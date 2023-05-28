struct VideosModel: Codable {
    var videos:[video]
}

struct video: Codable {
    var id: Int
    var title: String
    var thumbnail: String
    var channelName: String
    var profilePic: String
    var views: String
    var timeStamp: String
    var liked: Bool
    var likeCount: Int
    var disliked: Bool
    var subscribe: Bool
    var category: String
}
