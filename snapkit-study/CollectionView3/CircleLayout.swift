//
//  circleLayout.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/20.
//

import UIKit
import Foundation

class CircleLayout: UICollectionViewFlowLayout {
    var itemCount: Int
    //    添加一个数组属性，用来存放每个item的布局信息
    var attributeArray: Array<UICollectionViewLayoutAttributes>?
    
    required init?(coder aDecoder: NSCoder) {
        itemCount = 0
        super.init(coder:aDecoder)
    }
    
    override init() {
        self.itemCount = 0
        super.init()
    }
    
    override func prepare() {
        //调用父类的准备方法
        super.prepare()
        //设置为竖直布局
        self.scrollDirection = .vertical
        //初始化数组
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        //先计算每个item的宽度，设置为三列布局
        
        self.itemCount = (self.collectionView?.numberOfItems(inSection: 0))!
        
        let radius: CGFloat = min((self.collectionView?.frame.width)!, (self.collectionView?.frame.height)!) / 2 - 40
        let center: CGPoint = CGPoint(x: (self.collectionView?.frame.width)! / 2, y: (self.collectionView?.frame.height)! / 2 - 94.0)

        //计算每个item的位置
        for index in 0..<self.itemCount{
            //设置IndexPath，默认为一个分区
            let indexPath = IndexPath(item: index, section: 0)
            //创建布局属性类
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attris.size = CGSize(width: 50, height: 50)
            
            //计算小圆距大圆圆心，x和y分别的距离
            let itemx: CGFloat = center.x + CGFloat(cosf(Float(2 * Float(M_PI) / Float(self.itemCount) * Float(index)))) * (radius - 25)
            let itemy: CGFloat = center.y + CGFloat(sinf(Float(2 * Float(M_PI) / Float(self.itemCount) * Float(index)))) * (radius - 25)
            attris.center = CGPoint(x: CGFloat(itemx), y: CGFloat(itemy))
            self.attributeArray?.append(attris)
        }
        
    }
    //  将item的frame信息数组返回
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
    
}
