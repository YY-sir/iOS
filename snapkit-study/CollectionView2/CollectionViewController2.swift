//
//  CollectionViewController2.swift
//  snapkit-study
//
//  Created by YY on 2021/1/19.
//

 
import UIKit
 
class CollectionViewController2: UIViewController  {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建瀑布流视图布局类
        let layout = WaterFallLayout(itemCount: 300)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 30
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.bounds,collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //注册载体数据类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemID")
        self.view.addSubview(collectionView)
    }
}
 
extension CollectionViewController2: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemID", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        return cell
    }
    
//    点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击了第\(indexPath.section)第\(indexPath.row)个item")
    }
}
