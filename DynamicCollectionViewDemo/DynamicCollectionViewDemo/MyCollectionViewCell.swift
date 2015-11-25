//
//  MyCollectionViewCell.swift
//  DynamicCollectionViewDemo
//
//  Created by 刘铎 on 15/11/24.
//  Copyright © 2015年 liuduoios. All rights reserved.
//

import UIKit
import DynamicCollectionView

class MyCollectionViewCell: DynamicCollectionViewCell<Model> {
    
    typealias ItemType = Model
    
    var label: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.textAlignment = .Center
        return label
    }()
    
    var sublabel: UILabel = {
        let sublabel = UILabel(frame: CGRectZero)
        sublabel.textAlignment = .Center
        return sublabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.darkGrayColor()
        label.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(contentView.bounds), height: CGRectGetHeight(contentView.bounds) / 2.0)
        contentView.addSubview(label)
        
        sublabel.frame = CGRect(x: 0, y: CGRectGetHeight(contentView.bounds) / 2.0, width: CGRectGetWidth(contentView.bounds), height: CGRectGetHeight(contentView.bounds) / 2.0)
        contentView.addSubview(sublabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func bindModel(model: ItemType) {
        label.text = model.text
        sublabel.text = model.subtext
    }
    
}
