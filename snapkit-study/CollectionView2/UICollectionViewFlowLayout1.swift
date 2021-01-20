//
//  UICollectionViewFlowLayout1.swift
//  snapkit-study
//
//  Created by YY on 2021/1/19.
//
 
import UIKit
 
class WaterFallLayout: UICollectionViewFlowLayout {
//    封装一个属性，用来设置item的个数
    let itemCount:Int
//    添加一个数组属性，用来存放每个item的布局信息
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
//    实现必要的构造方法
    required init?(coder aDecoder: NSCoder) {
        itemCount = 0
        super.init(coder:aDecoder)
    }
//    自定义一个初始化构造方法
    init(itemCount:Int) {
        self.itemCount = itemCount
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
        let WIDTH = (UIScreen.main.bounds.size.width-2 * self.minimumInteritemSpacing)/3
        //定义一个元组表示每一列的动态高度（决定有多少列）
        var queueHieght:(one:Int,two:Int, thrid:Int) = (0, 0, 0)
        //进行循环设置item的frame
        for index in 0..<self.itemCount {
            //设置IndexPath，默认为一个分区
            let indexPath = IndexPath(item: index, section: 0)
            //创建布局属性类
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            //随机一个高度在80到190之间的值
            let height:Int = Int(arc4random()%120+70)
            //哪列高度小就把它放那列下面
            //标记那一列
            var queue = 0
            if queueHieght.one <= queueHieght.two && queueHieght.one <= queueHieght.thrid{
                queueHieght.one += (height+Int(self.minimumLineSpacing))
                queue = 0
            } else if queueHieght.two <= queueHieght.thrid{
                queueHieght.two += (height+Int(self.minimumLineSpacing))
                queue = 1
            } else{
                queueHieght.thrid += (height+Int(self.minimumLineSpacing))
                queue = 2
            }
            //设置item的CGRect（因为每个item的高度不同）
//            let tmpH = queue == 0 ? queueHieght.one-height : queueHieght.two-height
            let tmpH: CGFloat
            switch queue {
            case 0:
                tmpH = CGFloat(CGFloat(queueHieght.one-height)-self.minimumLineSpacing)
            case 1:
                tmpH = CGFloat(CGFloat(queueHieght.two-height)-self.minimumLineSpacing)
            default:
                tmpH = CGFloat(CGFloat(queueHieght.thrid-height)-self.minimumLineSpacing)
            }
            attris.frame = CGRect(x: (self.minimumInteritemSpacing+WIDTH)*CGFloat(queue), y: CGFloat(tmpH), width: WIDTH, height: CGFloat(height))
            //将item的frame信息添加到数组中（最后返回回去）
            attributeArray?.append(attris)
        }
        //以最大一列的高度计算每个item高度，这样可以保证滑动范围的正确(滑动的范围根据itemSize的大小来定)
        if queueHieght.one >= queueHieght.two  && queueHieght.one >= queueHieght.thrid{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHieght.one * 3/self.itemCount)-self.minimumLineSpacing)
        } else if queueHieght.two >= queueHieght.thrid{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHieght.two * 3/self.itemCount)-self.minimumLineSpacing)
        }else{
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHieght.thrid * 3/self.itemCount)-self.minimumLineSpacing)
        }
    }
    
    //将设置好存放每个item的布局信息返回
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
}
