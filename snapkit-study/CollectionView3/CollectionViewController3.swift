//
//  CollectionViewController3.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/20.
//

import UIKit

class CollectionViewController3: UIViewController {
    override func viewDidLoad() {
        let layout = CircleLayout()
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CollectionViewController3Cell.self, forCellWithReuseIdentifier: CollectionViewController3Cell.reused)
        self.view.addSubview(collectionview)
        collectionview.backgroundColor = UIColor.white
    }
    
}

extension CollectionViewController3: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewController3Cell.reused, for: indexPath)


        return cell
    }
    
    
}

private class CollectionViewController3Cell: UICollectionViewCell {
    static let reused: String = "CollectionViewController3CellIdentify"
    private let b1: UIButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(b1)
        b1.snp.makeConstraints {(make) in
            make.size.equalToSuperview()
        }
        b1.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        
        b1.layer.cornerRadius = 25
        b1.clipsToBounds = true
    }
}
