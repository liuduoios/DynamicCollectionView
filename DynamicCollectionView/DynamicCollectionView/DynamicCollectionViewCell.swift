//
//  DynamicCollectionViewCell.swift
//  DynamicCollectionView
//
//  Created by 刘铎 on 15/11/24.
//  Copyright © 2015年 liuduoios. All rights reserved.
//

import UIKit

public protocol BindableCollectionViewCell {
    typealias ItemType
    func bindModel(model: ItemType)
}

public class DynamicCollectionViewCell<T>: UICollectionViewCell, BindableCollectionViewCell {
    
    public typealias ItemType = T

    public func bindModel(model: ItemType) {
        // subclass implement
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
