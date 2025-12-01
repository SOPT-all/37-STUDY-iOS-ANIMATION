import UIKit
import SnapKit

class InfinityCarouselViewController: UIViewController {

    private let imageArray: [UIImage?] = [
        UIImage(named: "kirby4"),
        UIImage(named: "kirby1"),
        UIImage(named: "kirby2"),
        UIImage(named: "kirby3"),
        UIImage(named: "kirby4"),
        UIImage(named: "kirby1")
    ]

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true 
        cv.showsHorizontalScrollIndicator = false
        cv.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setHierarchy()
        setLayout()
    }


    private func setHierarchy() {
        view.addSubview(collectionView)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
    }
}

extension InfinityCarouselViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as? CarouselCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = imageArray[indexPath.item]
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = 300.0
        let count = imageArray.count
        
        if scrollView.contentOffset.x == 0 {
          
            let offsetX = CGFloat(count - 2) * width
            scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        } else if scrollView.contentOffset.x == CGFloat(count - 1) * width {
          
            let offsetX = width
            scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        }
    }
}

class CarouselCell: UICollectionViewCell {
    static let identifier = "CarouselCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    InfinityCarouselViewController()
}
