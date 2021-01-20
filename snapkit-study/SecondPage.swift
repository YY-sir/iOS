//
//  SecondPage.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/18.
//

//import Foundation
import UIKit

class SecondPageController: UIViewController {
    let backPage : UIButton = UIButton()
    let frontPage: UIButton = UIButton()
    var secondpage: SecondCollectionView!
    let buttonW = 70
    let buttonH = 30
    let left = 30
    let bottom = 30
    var topMargin: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("第二页")
        
        //获取navigationBar距离上边界的距离
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let topPadding = window?.safeAreaInsets.top as!CGFloat
        //获取navigaationBar的高度（除开topPPading）
        topMargin = (self.navigationController?.navigationBar.frame.size.height
                            as! CGFloat) + topPadding
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "欢迎来到CollectionView"
        
        //frame传给SecondPage进行初始化
        self.secondpage = SecondCollectionView(frame: CGRect(x: 0, y: topMargin, width: self.view.bounds.width, height: 600))
        self.view.addSubview(backPage)
        self.view.addSubview(frontPage)
        self.view.addSubview(secondpage)
        setupView()
        setupButton()
        
        
    }
    func setupView(){
        self.view.backgroundColor = .white
    }
    
    
    
    @objc func setupButton(){
        self.backPage.backgroundColor = Common().LDColor(rgbValue: 0xFF6633, al: 1)
        self.backPage.setTitle("上一页", for: .normal)
        self.backPage.layer.cornerRadius = 2
        self.backPage.snp.makeConstraints {(make) in
            make.width.equalTo(70)
            make.height.left.equalTo(30)
            make.bottom.equalTo(-30)
        }
        self.backPage.setTitleColor(Common().LDColor(rgbValue: 0xFF6633, al: 1), for: .highlighted)
        self.backPage.addTarget(self, action: #selector(nextPageOnclickDown), for: .touchDown)
        self.backPage.addTarget(self, action: #selector(nextPagetouchUpOutside), for: [.touchUpOutside,.touchUpInside])
        self.backPage.addTarget(self, action: #selector(nextPagetouchUpInside), for: .touchUpInside)
        //
        self.frontPage.backgroundColor = Common().LDColor(rgbValue: 0xFF6633, al: 1)
        self.frontPage.setTitle("下一页", for: .normal)
        self.frontPage.layer.cornerRadius = 2
        self.frontPage.snp.makeConstraints {(make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.bottom.right.equalTo(-30)
        }
        self.frontPage.setTitleColor(Common().LDColor(rgbValue: 0xFF6633, al: 1), for: .highlighted)
        self.frontPage.addTarget(self, action: #selector(nextPageOnclickDown), for: .touchDown)
        self.frontPage.addTarget(self, action: #selector(nextPagetouchUpOutside), for: [.touchUpOutside,.touchUpInside])
        self.frontPage.addTarget(self, action: #selector(nextPagetouchUpInside), for: .touchUpInside)
        
    }
    @objc func nextPageOnclickDown(sender: UIButton){
        sender.backgroundColor = .white
    }
    @objc func nextPagetouchUpOutside(sender: UIButton){
        sender.backgroundColor = Common().LDColor(rgbValue: 0xFF6633, al: 1)
    }
    @objc func nextPagetouchUpInside(sender: UIButton){
        if(sender == self.backPage){
            self.navigationController?.popViewController(animated: true)
            return
        }else if sender == self.frontPage{
            
        }
    }
}

