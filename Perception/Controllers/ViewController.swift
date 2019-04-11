import UIKit
import SceneKit
import ARKit
import ExpandingMenu


class ViewController: UIViewController {
  
  let mainView = Main()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(mainView)
    addExpandingMenu()
    mainView.sceneView.delegate = self
    mainView.sceneView.showsStatistics = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let configuration = ARImageTrackingConfiguration()
    
    if let trackedImage = ARReferenceImage.referenceImages(inGroupNamed: "ARPerception", bundle: Bundle.main){
      configuration.trackingImages = trackedImage
      configuration.maximumNumberOfTrackedImages = 1
      print("images found in viewWillAppear trackedImage")
    }
    
    mainView.sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainView.sceneView.session.pause()
  }
    
    private func addExpandingMenu() {
        let menuButtonSize: CGSize = CGSize(width: 30, height: 30)
        let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: menuButtonSize), image: UIImage(named: "more")!, rotatedImage: UIImage(named: "more")!)
        menuButton.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton)
        menuButton.layer.cornerRadius = 5
        menuButton.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
      
        //        menuButton.expandingAnimations = []
        //        menuButton.foldingAnimations = []
        let share = ExpandingMenuItem(size: menuButtonSize, title: "Share", image: UIImage(named: "share")!, highlightedImage: UIImage(named: "share")!, backgroundImage: nil, backgroundHighlightedImage: nil) { () -> Void in
            print("trying to share video")
            //            if let videoToShare = video {
            //                let activityViewController = UIActivityViewController(activityItems: [videoToShare], applicationActivities: nil)
            //                present(activityViewController, animated: true)
            //            }
        }
        
        let save = ExpandingMenuItem(size: menuButtonSize, title: "Save", image: UIImage(named: "starEmpty")!, highlightedImage: UIImage(named: "starEmpty")!, backgroundImage: nil, backgroundHighlightedImage: nil) { () -> Void in
            print("video saved")
        }
        let myVideos = ExpandingMenuItem(size: menuButtonSize, title: "My Videos", image: UIImage(named: "table")!, highlightedImage: UIImage(named: "table")!, backgroundImage: nil, backgroundHighlightedImage: nil) { () -> Void in
            print("going to saved videos")
        }
        
        let profile = ExpandingMenuItem(size: menuButtonSize, title: "Profile", image: UIImage(named: "profile")!, highlightedImage: UIImage(named: "profile")!, backgroundImage: nil, backgroundHighlightedImage: nil) { () -> Void in
            print("profile clicked")
        }
        
        let menuItems = [share, save, myVideos, profile]
        menuItems.forEach{ $0.layer.cornerRadius = 5 }
        menuItems.forEach{ $0.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)}
        menuItems.forEach{ $0.titleColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)}
        menuItems.forEach{ $0.titleMargin = 5 }
        menuButton.playSound = false
        menuButton.addMenuItems(menuItems)
        menuButton.willDismissMenuItems = { (menu) -> Void in
            menuItems.forEach{ $0.isHidden = true }
        }
        menuButton.willPresentMenuItems = { (menu) -> Void in
            menuItems.forEach{ $0.isHidden = false }
        }
        view.addSubview(menuButton)
    }


}

extension ViewController: ARSCNViewDelegate {
  
  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    let node = SCNNode()
    if let imageAnchor = anchor as? ARImageAnchor {
      
      let videoNode = SKVideoNode(fileNamed: "\(imageAnchor.referenceImage.name!.description).mp4")
      videoNode.play()
      let videoScene = SKScene(size: CGSize(width: 480, height: 360))
      videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
      videoNode.yScale = -1.0
      videoScene.addChild(videoNode)
      
      let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
      plane.firstMaterial?.diffuse.contents = videoScene
      let planeNode = SCNNode(geometry: plane)
      planeNode.eulerAngles.x = -.pi/2
      node.addChildNode(planeNode)
      
    } else {
      print("No image was detected at renderer function")
    }
    return node
  }
}
