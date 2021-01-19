//
//  SecondCollectionView.swift
//  snapkit-study
//
//  Created by YY on 2021/1/18.
//

import Foundation
import UIKit
class SecondCollectionView: UIView {
    private var collectionView:UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 50)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 40
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册collectionView
        collectionView.register(SecondPageCell.self, forCellWithReuseIdentifier: SecondPageCell.reused)
        self.addSubview(collectionView)
        
    }
}

extension SecondCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondPageCell.reused, for: indexPath) as!SecondPageCell
        cell.backgroundColor = UIColor.white
//        cell.snp.makeConstraints {(make) in
//            make.height.equalTo(50)
//            make.width.equalTo(30)
//        }
        print("---\(indexPath[0])---\(indexPath[1])---")
        
        return cell
    }
}

private class SecondPageCell: UICollectionViewCell {
    static let reused: String = "SecondPageCellIdentify"
    private let b1 = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = UIColor.blue
        self.addSubview(b1)
        
        self.b1.setTitle("111", for: .normal)
        self.b1.setTitleColor(UIColor.black, for: .normal)
        self.b1.backgroundColor = UIColor.blue
        self.b1.snp.makeConstraints {(make) in
            make.width.height.equalTo(30)
            make.center.equalTo(self)
        }
        
    }
    
}

