import UIKit
import paper_onboarding

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var contentView: OnboardingView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.dataSource = self
        contentView.delegate = self
        doneButton.addTarget(self, action: #selector(segueToMainVC), for: .touchUpInside)
    }
    
    @objc func segueToMainVC() {
     let viewController = ViewController()
        self.present(viewController, animated: true)
        
    }

}

extension OnBoardingViewController: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let bgOne = #colorLiteral(red: 0.1163222715, green: 0.1882246733, blue: 0.319499135, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        let bgThree = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        
        let largeFont = UIFont(name: "HelveticaNeue-Bold", size: 18)!
        let smallFont = UIFont(name: "HelveticaNeue", size: 14)!
        
         return [OnboardingItemInfo.init(informationImage: #imageLiteral(resourceName: "camera"), title: "String", description: "String", pageIcon: #imageLiteral(resourceName: "dot"), color: bgOne, titleColor: bgTwo, descriptionColor: bgThree, titleFont: largeFont, descriptionFont: smallFont),
                OnboardingItemInfo.init(informationImage: #imageLiteral(resourceName: "paper"), title: "String", description: "String", pageIcon: #imageLiteral(resourceName: "dot"), color: bgOne, titleColor: bgTwo, descriptionColor: bgThree, titleFont: largeFont, descriptionFont: smallFont),
            OnboardingItemInfo.init(informationImage: #imageLiteral(resourceName: "video"), title: "String", description: "String", pageIcon: #imageLiteral(resourceName: "dot"), color: bgOne, titleColor: bgTwo, descriptionColor: bgThree, titleFont: largeFont, descriptionFont: smallFont)][index]
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            doneButton.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2 {
            if doneButton.isHidden == false {
                doneButton.isHidden = true
            }
        }
    }
   
    
    
   
}