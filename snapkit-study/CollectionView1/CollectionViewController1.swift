//
//  CollectionViewController.swift
//  snapkit-study
//
//  Created by YY on 2021/1/19.
//

import UIKit

class CollectionViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("这是九宫格")
        
        let collectionview1 = CollectionView1(frame: self.view.bounds)
        self.view.addSubview(collectionview1)
    }
    
}
