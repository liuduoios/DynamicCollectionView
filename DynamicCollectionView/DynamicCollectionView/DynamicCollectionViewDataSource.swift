//
//  DynamicCollectionViewDataSource.swift
//  DynamicCollectionView
//
//  Created by 刘铎 on 15/11/24.
//  Copyright © 2015年 liuduoios. All rights reserved.
//

import Foundation

class DynamicCollectionViewDataSource<T>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // ------------------
    // MARK: - Properties
    // ------------------
    
    weak var collectionView: UICollectionView?
    
    var datas: [T] = [T]()
    
    // --------------------
    // MARK: - Internal API
    // --------------------
    
    func addData(data: T) {
        datas.append(data)
        collectionView?.insertItemsAtIndexPaths([NSIndexPath(forItem: datas.count - 1, inSection: 0)])
    }
    
    func removeLastData() {
        if datas.count == 0 { return }
        datas.removeLast()
        collectionView?.deleteItemsAtIndexPaths([NSIndexPath(forItem: datas.count, inSection: 0)])
    }
    
    func removeAllDatas() {
        if datas.count == 0 { return }
        datas.removeAll()
        collectionView?.reloadData()
    }
    
    // ----------------------------------
    // MARK: - UICollectionViewDataSource
    // ----------------------------------
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! DynamicCollectionViewCell<T>
        let data = datas[indexPath.row]
        cell.bindModel(data)
        return cell
    }
    
}