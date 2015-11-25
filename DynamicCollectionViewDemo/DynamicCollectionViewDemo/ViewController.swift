//
//  ViewController.swift
//  DynamicCollectionViewDemo
//
//  Created by 刘铎 on 15/11/24.
//  Copyright © 2015年 liuduoios. All rights reserved.
//

import UIKit
import DynamicCollectionView

class ViewController: UIViewController {
    
    var dynamicCollectionView: DynamicCollectionView<Model>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dynamicCollectionView = DynamicCollectionView<Model>(frame: CGRect(x: 0, y: 20, width: CGRectGetWidth(view.frame), height: 600))
        dynamicCollectionView.setBgColor(UIColor.lightGrayColor())
        dynamicCollectionView.collectionViewLayout.itemSize = CGSize(width: CGRectGetWidth(dynamicCollectionView.frame), height: 100)
        dynamicCollectionView.registerCollectionViewCellClass(MyCollectionViewCell.self)
        view.addSubview(dynamicCollectionView)
        dynamicCollectionView.reloadData()
        
//        dynamicCollectionView.addItem("abc")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(sender: UIButton) {
        let model = Model(text: "text", subtext: "\(arc4random() % 100)")
        dynamicCollectionView.addItem(model)
    }

    @IBAction func removeLastItem(sender: UIButton) {
        dynamicCollectionView.removeLastItem()
    }
    
    @IBAction func removeAll(sender: UIButton) {
        dynamicCollectionView.removeAllItems()
    }
    
}

