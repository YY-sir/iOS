//
//  CollectionViewController4.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/21.
//

import UIKit

class CollectionViewController4: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = PickerView()
        layout.collectionViewContentSize
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell4")
        self.view.addSubview(collectionview)
        collectionview.backgroundColor = UIColor.white
        
    }
    
}

extension CollectionViewController4: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        let l1: UILabel = UILabel()
        l1.text = "我是第\(indexPath.row)行"
        l1.textColor = UIColor.white
        
        cell.addSubview(l1)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //小于半屏 则放到最后一屏多半屏
        if scrollView.contentOffset.y < 200 {
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y + 10 * 400)
            //大于最后一屏多一屏 放回第一屏
        }else if scrollView.contentOffset.y > 11 * 400{
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y - 10 * 400)
        }
    }
    
}
