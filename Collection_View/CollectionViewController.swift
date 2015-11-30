//
//  CollectionViewController.swift
//  Collection_View
//
//  Created by Stripes.sin on 2015. 11. 30..
//  Copyright © 2015년 Stripes.sin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"

class CollectionViewController: UICollectionViewController {

    var carImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
      
        carImages = [
                                "chevy_small.jpg", "mini_small.jpg", "rover_small.jpg", "smart_small.jpg", "highlander_small.jpg",
                                "venza_small.jpg", "volvo_small.jpg", "vw_small.jpg", "ford_small.jpg", "nissan_small.jpg",
                                "honda_small.jpg", "jeep_small.jpg"
                            ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        print(UIDevice.currentDevice().orientation)
    }
  
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("landscape")
        } else {
            print("portraight")
        }
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return carImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell

        let image = UIImage(named: carImages[indexPath.row])
        cell.imageView.image = image
      
      return cell
    }

    func collectionView(collectionView:UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
//      let image = UIImage(named: carImages[indexPath.row])
//      return image!.size
        let size = (self.view.frame.width / 2) - 5
        return CGSizeMake(size, size)
    }
  
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
      print("ddddd")
//      let myLayout = UICollectionViewFlowLayout()
//      myLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//      self.collectionView?.setCollectionViewLayout(myLayout, animated: true)
    }
  
    override func collectionView(collectionView:UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
    
      var header: SupplementaryView?
      if kind == UICollectionElementKindSectionHeader {
        header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MyHeader", forIndexPath: indexPath) as? SupplementaryView
      
        header?.headerLabel.text = "Car Image Gallery"
      }
      return header!
    }
  
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
