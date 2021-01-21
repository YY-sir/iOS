//
//  PickerView.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/21.
//

import UIKit

class PickerView: UICollectionViewFlowLayout {
    var itemCount: Int!
    var attribuite: Array<UICollectionViewLayoutAttributes>?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override init() {
        itemCount = 0
        super.init()
    }
    override func prepare() {
        attribuite = Array<UICollectionViewLayoutAttributes>()
        itemCount = self.collectionView?.numberOfItems(inSection: 0)
        
        self.itemSize = (self.collectionView?.frame.size)!
        
        
        
        
        for index in 0..<itemCount {
            let indexPath = IndexPath(item: index, section: 0)
            let atti = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            atti.size = CGSize(width: 260, height: 100)
            atti.center = CGPoint(x: (self.collectionView?.frame.width)! / 2, y: (self.collectionView?.frame.height)! / 2 - 94 + (self.collectionView?.contentOffset.y)!)
            
            //创建一个transform3D类
            //CATransform3D是一个类似矩阵的结构体
            //CATransform3DIdentity创建空得矩阵
            var trans3D: CATransform3D = CATransform3DIdentity
    //        CATransform3D trans3D = CATransform3DIdentity;
            //这个值设置的是透视度，影响视觉离投影平面的距离
            trans3D.m34 = -1/500.0
            //下面这些属性 后面会具体介绍
            //这个是3D滚轮的半径
            let radius: CGFloat = CGFloat(50/tanf(Float(M_PI)*2/Float(itemCount)/2))
            //计算每个item应该旋转的角度
            let angle: CGFloat = CGFloat(Float(indexPath.row)/Float(itemCount)*Float(M_PI)*2)
            //这个方法返回一个新的CATransform3D对象，在原来的基础上进行旋转效果的追加
            //第一个参数为旋转的弧度，后三个分别对应x，y，z轴，我们需要以x轴进行旋转
            trans3D = CATransform3DRotate(trans3D, angle, 1.0, 0, 0);
            //这个方法也返回一个transform3D对象，追加平移效果，后面三个参数，对应平移的x，y，z轴，我们沿z轴平移
            trans3D = CATransform3DTranslate(trans3D, 0, 0, radius);
            //进行设置
            atti.transform3D = trans3D
            attribuite?.append(atti)
        }
        
        
        
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        itemCount = self.collectionView?.numberOfItems(inSection: 0)
        //遍历设置每个item的布局属性
//        for index in 0..<self.itemCount{
//            attribuite?.append(self.layoutAttributesForItem(at: NSIndexPath(item: index, section: 0) as IndexPath )!)
//        }
        
        return attribuite
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        <#code#>
    }
    
    
}
