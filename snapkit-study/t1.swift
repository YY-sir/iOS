//
//  t1.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/14.
//

import Foundation
import UIKit
class Login: UIView {
    let l1 : UILabel = UILabel()
    let l2 : UILabel = UILabel()
    let t1 : UITextField = UITextField()
    let t2 : UITextField = UITextField()
    let b1 : UIButton = UIButton()
    let bottomView : UIView = UIView()
    var timer : Timer!
    var isAnimattion = false
    init() {
        super.init(frame: CGRect.zero)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notifition:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        b1.addTarget(self, action: #selector(self.handleKeyboardDidHide), for: .touchUpInside)
        
        setupContainerView()
    
        self.isAnimattion = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainerView(){
        self.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
        self.snp.makeConstraints {(make) in
            make.height.equalTo(140)
            make.width.equalTo(250)
        }
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        
        self.addSubview(l1)
        l1.text = "账号："
        l1.snp.makeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(20)
            make.left.equalTo(20)
        }
        
        self.addSubview(l2)
        l2.text = "密码："
        l2.snp.makeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(60)
            make.left.equalTo(20)
        }
        
        self.addSubview(t1)
        t1.returnKeyType = .next
        t1.placeholder = "请输入账号"
        t1.backgroundColor = .white
        t1.layer.cornerRadius = 2
        t1.clipsToBounds = true
        t1.snp.makeConstraints {(make) in
            make.width.equalTo(150)
            make.height.equalTo(28)
            make.left.equalTo(80)
            make.centerY.equalTo(l1)
        }
        
        self.addSubview(t2)
        t2.returnKeyType = .done
        t2.placeholder = "请输入密码"
        t2.backgroundColor = .white
        t2.isSecureTextEntry = true
        t2.layer.cornerRadius = 2
        t2.clipsToBounds = true
        t2.snp.makeConstraints {(make) in
            make.width.equalTo(150)
            make.height.equalTo(28)
            make.left.equalTo(80)
            make.centerY.equalTo(l2)
        }
        t1.delegate = self
        t2.delegate = self

        
        self.addSubview(b1)
        b1.setTitle("登陆", for: .normal)
        b1.backgroundColor = LDColor(rgbValue: 0xFF6633, al: 1)
        
        b1.snp.makeConstraints {(make) in
            make.height.equalTo(40)
            make.left.bottom.right.equalTo(self)
        }
        
        self.addSubview(bottomView)
        bottomView.backgroundColor = LDColor(rgbValue: 0xcccccc, al:1)
        bottomView.alpha = 0
        bottomView.snp.makeConstraints {(make) in
            make.width.equalTo(self)
            make.height.equalTo(35)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        self.bringSubviewToFront(b1)
        b1.clipsToBounds = true
        
    }
    
    @objc func handleKeyboardDidHide(){
//        window?.endEditing(true)
        if !isAnimattion{
            return
        }
        
        self.t1.resignFirstResponder()
        self.t2.resignFirstResponder()
        
        print("收起键盘")
        l1.snp.remakeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(20)
            make.left.equalTo(self.snp.right)
        }
        self.t1.snp.remakeConstraints{(make) in
            make.centerY.equalTo(l1)
            make.left.equalTo(self.l1.snp.right)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        self.t2.snp.remakeConstraints{(make) in
            make.centerY.equalTo(l2)
            make.right.equalTo(self.snp.left)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        self.l2.snp.remakeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(60)
            make.right.equalTo(self.t2.snp.left)
        }

        self.b1.snp.remakeConstraints {(make) in
            make.width.equalTo(100)
            make.height.equalTo(35)
            make.bottom.right.equalTo(self)
        }
        UIView.animate(withDuration: 1, animations: {
            self.layoutIfNeeded()
            self.bottomView.alpha = 1
        }){(finnish) in
            if finnish{
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.animation), userInfo: nil, repeats: false)
            }
        }
        self.isAnimattion = false
    }
    
    @objc func animation(){
        print("animation")
        self.l1.snp.remakeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(20)
            make.left.equalTo(20)
        }
        self.l2.snp.remakeConstraints {(make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(60)
            make.left.equalTo(20)
        }
        self.t1.snp.remakeConstraints {(make) in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.left.equalTo(80)
            make.centerY.equalTo(l1)
        }
        self.t2.snp.remakeConstraints {(make) in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.left.equalTo(80)
            make.centerY.equalTo(l2)
        }
        
        self.b1.snp.remakeConstraints {(make) in
            make.height.equalTo(35)
            make.left.bottom.right.equalTo(self)
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.5, animations:{
            self.layoutIfNeeded()
            self.bottomView.alpha = 0
        }){(finnish) in
            if finnish{
                self.timer.invalidate()
                self.timer = nil
                self.isAnimattion = true
            }
            
        }
    }
    
//    @objc func keyboardWillShow(notifition : Notification){
//        if let userInfo = notifition.userInfo as? Dictionary<String, Any>{
//            if let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                let keyboardSize = keyboardFrameValue.cgRectValue
//
//                print("显示键盘\(keyboardSize)")
//                print("显示键盘\(keyboardSize.height)")
//            }
//        }
//
//    }

}


func LDColor(rgbValue:UInt, al:Float) -> UIColor {
    return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0xFF) / 255.0, alpha: CGFloat(al))

}

extension Login: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.t1{
            self.t2.becomeFirstResponder()
        }else{
            self.t2.resignFirstResponder()
        }
        return true
    }
}


