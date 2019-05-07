import UIKit

class Constants {
    static let loginViewMessageSaveVideo = "⚠️ Please sign in to save video ⚠️"
    static let loginViewMessageViewProfile = "⚠️ Please sign in to view profile ⚠️"
    static let loginViewMessageViewMyVideos = "⚠️ Please sign in to view your videos ⚠️"
    static let DemoCompletedUserDefaultsKey = "demoCompleted"
    
    public enum UltimateDestinationEnum {
        case myVideos
        case myProfile
    }
    
    static let savedVideoCollectionViewCellExpandedHeight: CGFloat = 375
    static let savedVideoCollectionViewCellNonExpandedHeight: CGFloat = 275
}
