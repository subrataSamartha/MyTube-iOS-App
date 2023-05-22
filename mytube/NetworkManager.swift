import Foundation

class NetworkManager {
    static var shared = NetworkManager()

    
    private init() {}
    
   
    func getVideos(completion: @escaping ((VideosModel?, String?) -> Void)){
        
        
        guard let endPointURL = Bundle.main.url(forResource: "APIRes", withExtension: "json") else {
            completion(nil, "could not find APIResponse.json")
            return
        }
        
        guard let videosURLData = try? Data(contentsOf: endPointURL) else {
            completion(nil, "Counld not convert data")
            return
        }
       
            
        do {
            let myDecoder = JSONDecoder()
            let videosData = try myDecoder.decode(VideosModel.self, from: videosURLData)
            completion(videosData, nil)
        } catch {
            completion(nil, "Error occured while decoding data")
        }
  
    }

    func updateToVideos(updatedVideosData: VideosModel) {
        guard let endPointURL = Bundle.main.url(forResource: "APIRes", withExtension: "json") else {
            print("could not find APIResponse.json")
            return
        }
        


        do {
            let myEncoder = JSONEncoder()
            try myEncoder.encode(updatedVideosData).write(to: endPointURL)
            print(updatedVideosData.videos[0])
        } catch {
            print("error while encoding")
        }
    }
}
