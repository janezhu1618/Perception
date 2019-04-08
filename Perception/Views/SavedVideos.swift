import UIKit

class SavedVideos: UIView {

    lazy var myCollectionView: UICollectionView = {
        //CREATE THE LAYOUT:
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 275)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(myCollectionView)
        myCollectionView.register(FavoriteCollectionCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        cvConstrains()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cvConstrains() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), myCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), myCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), myCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)].forEach{$0.isActive = true }
        
    }
    

}
