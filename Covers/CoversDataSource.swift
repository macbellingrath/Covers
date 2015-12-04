//
//  CoverDatSource.swift
//  Covers
//
//  Created by Mac Bellingrath on 10/13/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import AFNetworking

typealias Dictionary = [String : AnyObject]

class CoversDataSource: NSObject,  UICollectionViewDataSource {
    
    var albums:[Album] = []
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CoverCollectionViewCell
        cell.imageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: albums[indexPath.item].info.["artworkUrl30"])))
        
        //configure collection view cell
        
        return cell
    }
    
    
    //MARK: - Networking
    
    let manager = AFHTTPRequestOperationManager()
    
    func searchForAlbum(named: String, completion: () -> ()) {
        
        albums = []
        
        let params = ["term" : named]
        
        let urlString = "https://itunes.apple.com/search?"
        
        manager.GET(urlString, parameters: params, success: { (operation, data) -> Void in
            
            if let foundInfo = data as? Dictionary {
                if let results = foundInfo["results"] as? [Dictionary] {
                    for result in results {
                        let album = Album(info: result)
                        self.albums.append(album)
                       print(result)
                    }
                }
            }
            
            }) { (operation, error) -> Void in
//                print(error)
        }
    }
}
