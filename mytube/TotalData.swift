//
//  TotalData.swift
//  mytube
//
//  Created by subrata Samartha on 21/05/23.
//

import Foundation

class TotalData {
    static var shared = TotalData()
    
    var videos: VideosModel
    
    private init() {
        videos = VideosModel(videos: [])
    }
    
    
}
