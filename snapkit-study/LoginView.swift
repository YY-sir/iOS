//
//  LoginView.swift
//  snapkit-study
//
//  Created by Mac on 2021/1/14.
//

import Foundation
import UIKit

class LoginView: UIView {
    var btn:UIButton!
    init() {
        super.init(frame: CGRect.zero)
        btn = UIButton()
        btn.setTitle("1111", for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        self.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.right.top.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
