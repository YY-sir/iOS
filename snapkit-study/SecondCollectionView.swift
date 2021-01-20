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
    var data = [["01","02","03","04","05","06","07","08"],["11","12","13","14","15","16","17","18"],["21","22","23","24","25","26","27","28"]]
    
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
        //设置section的属性
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        layout.headerReferenceSize = CGSize(width: 375, height: 50)
        layout.footerReferenceSize = CGSize(width: 375, height: 100)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册collectionView
        collectionView.register(SecondPageCell.self, forCellWithReuseIdentifier: SecondPageCell.reused)
        collectionView.register(SecondPageSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SecondPageSectionHeader.reused)
        collectionView.register(SecondPageSectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SecondPageSectionFooter.reused)
        self.addSubview(collectionView)
        
    }
}

extension SecondCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    //添加cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondPageCell.reused, for: indexPath) as!SecondPageCell
        
        //去除cell原有的内容
        for subView in cell.subviews{
            subView.removeFromSuperview()
        }
        
        cell.backgroundColor = UIColor.white
        cell.frame.size = CGSize(width: 60, height: 60)
        print("---\(indexPath[0])---\(indexPath[1])---")
        
        let b1 = UIButton()
        b1.backgroundColor = UIColor.blue
        b1.setTitle(self.data[indexPath[0]][indexPath[1]], for: .normal)
        b1.addTarget(self, action: #selector(cellButtonTarget(sender:)), for: .touchUpInside)
        cell.addSubview(b1)
        b1.snp.makeConstraints {(make) in
            make.size.equalToSuperview()
        }
        
        return cell
    }
    //cell里面button对应的点击事件
    @objc func cellButtonTarget(sender: UIButton){
        //获取cell的定位信息
        let cell: UICollectionViewCell = sender.superview as! UICollectionViewCell
        let cellIndexPath = self.collectionView.indexPath(for: cell)
        print("点击对应的框框\(String(describing: cellIndexPath))")
        //
        if cellIndexPath == [0,0]{
            let cvc1 = CollectionViewController1()
            self.firstViewController()?.navigationController?.pushViewController(cvc1, animated: true)
        }else if cellIndexPath == [0, 1]{
            let cvc2 = CollectionViewController2()
            self.firstViewController()?.navigationController?.pushViewController(cvc2, animated: true)
        }
        
    }
    
    //添加section头尾
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        print("---\(kind)---")
        print("---\(UICollectionView.elementKindSectionHeader)---")
        
        var reusableView: UICollectionReusableView!
        if kind == UICollectionView.elementKindSectionHeader{
            
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SecondPageSectionHeader.reused, for: indexPath) as! SecondPageSectionHeader
            (reusableView as!SecondPageSectionHeader).label.text = "这是Header"
            (reusableView as!SecondPageSectionHeader).label.snp.makeConstraints {(make) in
                make.width.height.equalToSuperview()
            }
            
        }else if kind == UICollectionView.elementKindSectionFooter{
            print("111")
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SecondPageSectionFooter.reused, for: indexPath) as! SecondPageSectionFooter
            (reusableView as!SecondPageSectionFooter).label.text = "这是Footer"
            (reusableView as!SecondPageSectionFooter).label.snp.makeConstraints {(make) in
                make.width.height.equalToSuperview()
            }
        }
        
        return reusableView
    }
    
    //
    
        
}



//Cell的Viewclass定义
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
    }
    
}

//Header区域View
private class SecondPageSectionHeader: UICollectionReusableView {
    static let reused: String = "SecondPageSectionHeaderIdentify"
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        label = UILabel.init()
        label.text = "这是header"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.yellow
        self.addSubview(label)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//Footer区域View
private class SecondPageSectionFooter: UICollectionReusableView {
    static let reused: String = "SecondPageSectionFooterIdentify"
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        label = UILabel.init()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.red
        self.addSubview(label)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//扩展UIView，找到最上层UIViewController
extension UIView {
    //返回该view所在VC
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
}
