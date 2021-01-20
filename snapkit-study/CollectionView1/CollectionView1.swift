//
//  CollectionView1.swift
//  snapkit-study
//
//  Created by YY on 2021/1/19.
//

import UIKit

class CollectionView1: UIView {
    private var collectionview: UICollectionView!
    var w : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCollectionView()
        w = (self.frame.width - 20) / 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        self.collectionview = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        self.collectionview.backgroundColor = .gray
        self.collectionview.dataSource = self
        self.collectionview.delegate = self
        
        self.collectionview.register(CollectionView1Cell.self, forCellWithReuseIdentifier: CollectionView1Cell.reuse)
        self.addSubview(self.collectionview)
        
    }
}

extension CollectionView1: UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: CollectionView1Cell.reuse, for: indexPath) as! CollectionView1Cell
        
        //去除cell原有的内容
        for subView in cell.subviews{
            subView.removeFromSuperview()
        }
        
        let uiview1 = UIView()
        cell.addSubview(uiview1)
        uiview1.backgroundColor = UIColor.init(displayP3Red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        if indexPath[1] % 2 == 0{
            uiview1.frame = CGRect(x: w / 4 - 1, y: w / 4 - 1, width: w / 2 , height: w / 2)
        }else{
            uiview1.frame.size = CGSize(width: w, height: w)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: w, height: w)
    }
    
    
    
    
}

private class CollectionView1Cell: UICollectionViewCell {
    static let reuse: String = "CollectionView1CellIdentify"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
