//
//  ViewController.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/14.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let test1 : Login = Login()
    let window : UIWindow = UIWindow()
    let nextPage : UIButton = UIButton()
    var isNextPageNormal : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        //键盘弹起 和 收起通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notifition:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notifition:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        //添加Login部分
        self.view.addSubview(self.test1)
        self.test1.snp.makeConstraints {(make) in
            make.center.equalTo(self.view)
        }
        
        //添加手势点击空白处收起键盘
        let gestrue = UITapGestureRecognizer(target: self, action: #selector(self.hideBoard))
        self.view.addGestureRecognizer(gestrue)
        
        //下一页
        self.view.addSubview(self.nextPage)
        setupNextPage()
        self.navigationController?.isNavigationBarHidden = true

        
    }
    
    
    @objc func hideBoard(){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notifition : Notification){
        if let userInfo = notifition.userInfo as? Dictionary<String, Any>{
            if let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardSize = keyboardFrameValue.cgRectValue
                self.test1.snp.remakeConstraints {(make) in
                    make.bottom.equalTo(self.view).offset(-(keyboardSize.height + 150))
                    make.height.equalTo(140)
                    make.width.equalTo(250)
                    make.centerX.equalTo(self.view)
                }
                
                UIView.animate(withDuration: 0.4, delay: 0, options:[ UIView.AnimationOptions.overrideInheritedDuration,UIView.AnimationOptions.overrideInheritedCurve], animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }

    }
    
    @objc func keyboardWillHide(notifition : Notification){
        if let userInfo = notifition.userInfo as? Dictionary<String, Any>{
            if let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardSize = keyboardFrameValue.cgRectValue
                self.test1.snp.remakeConstraints {(make) in
                    make.center.equalTo(self.view)
                    make.height.equalTo(140)
                    make.width.equalTo(250)
                }

                UIView.animate(withDuration: 0.4,delay: 0 ,options:[UIView.AnimationOptions.overrideInheritedDuration,UIView.AnimationOptions.overrideInheritedCurve] , animations: {
                    self.view.layoutIfNeeded()
                })
                print("隐藏键盘\(keyboardSize)")
                print("隐藏键盘\(keyboardSize.height)")
            }
        }
    }
    
    @objc func setupNextPage(){
        self.nextPage.backgroundColor = Common().LDColor(rgbValue: 0x555555, al: 0.4)
        self.nextPage.setTitle("下一页", for: .normal)
        self.nextPage.layer.cornerRadius = 2
        self.nextPage.snp.makeConstraints {(make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.right.bottom.equalTo(-30)
        }
        self.nextPage.setTitleColor(Common().LDColor(rgbValue: 0x555555, al: 0.4), for: .highlighted)
        self.nextPage.addTarget(self, action: #selector(nextPageOnclickDown), for: .touchDown)
        self.nextPage.addTarget(self, action: #selector(nextPagetouchUpOutside), for: [.touchUpOutside])
        self.nextPage.addTarget(self, action: #selector(nextPagetouchUpInside), for: [.touchUpInside])
    }
    
    @objc func nextPageOnclickDown(sender: UIButton){
        sender.backgroundColor = .white
    }
    @objc func nextPagetouchUpOutside(sender: UIButton){
        sender.backgroundColor = Common().LDColor(rgbValue: 0x555555, al: 0.4)
    }
    @objc func nextPagetouchUpInside(sender: UIButton){
        let second = SecondPageController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    
//    @objc func nextPageOnclick(){
//        if self.isNextPageNormal{
//            self.nextPage.backgroundColor = .white
//            self.isNextPageNormal = !self.isNextPageNormal
//        }else{
//            self.nextPage.backgroundColor = Common().LDColor(rgbValue: 0x555555, al: 0.4)
//            self.isNextPageNormal = !self.isNextPageNormal
//        }
//    }
}


