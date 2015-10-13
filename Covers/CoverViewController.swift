//
//  CoverViewController.swift
//  Covers
//
//  Created by Mac Bellingrath on 10/13/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import AFNetworking

class CoverViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    

    
    let coverData = CoversDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = coverData
        
        searchBar.delegate = self
        
    }

//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    //MARK: - Collection View
//    
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
//        return cell
//    }
//
    
    //MARK: - Search Bar

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        let searchText = searchBar.text ?? ""
       
            coverData.searchForAlbum(searchText) {
          
                self.collectionView.reloadData()
        }
        
        searchBar.resignFirstResponder()

    }





    //MARK: - Navigation
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
    }

}
    
    


