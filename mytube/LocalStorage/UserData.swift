import Foundation

class UserData {
    static var shared = UserData()

//      Accessing shared default objects
    let userDefaults = UserDefaults.standard
    
    var favFactArrat: [String] = []
    var locallyStoredVideoAtributes: [[String:Bool]] = [[String():Bool()]]
    
//    private init() {
//        locallyStoredVideoAtributes = (userDefaults.object(forKey: "videoAttributes")) as! [[String : Bool]]
//    }
    
//    func addVideoAttributesToUserData(newVideoAttribute: [String:Bool]) {
//        if !favFactArrat.contains(factOnScreen) {
//            favFactArrat.append(factOnScreen)
//            userDefaults.set(locallyStoredVideoAtributes, forKey: "videoAttributes")
//            print("videoAttributes added to User Data")
//        }
//    }
    
    func updateVideoAttributeInUserData() {
        userDefaults.set(locallyStoredVideoAtributes, forKey: "videoAttributes")
        print(locallyStoredVideoAtributes)
        print("User Data Updated")
    }
    
    func resetUserDefaultData() {
        // Write/Set Boolean in User Defaults
        UserDefaults.standard.set(true, forKey: UserDefaults.Keys.videoAttributes.rawValue)
        
        // Reset User Defaults
        UserDefaults.standard.reset()
        
        guard ((userDefaults.object(forKey: "videoAttributes")) is [[String : Bool]]) else {
            print("No data found in local ")
            return
        }
        
    }
    
}

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case videoAttributes
    }
    
    func reset() {
           Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }
    

}

