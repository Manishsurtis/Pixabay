//
//  PictureViewController.swift
//  Pixabay
//
//  Created by Manish on 10/06/22.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var getSearchKey = String()
    var pictManager = PictureManager()
    var picList = [Picture]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Picture"
        get_Picture_List_APICall()
    }
    
    func get_Picture_List_APICall(){
        
        pictManager.delegate = self
        pictManager.fetchpicture(searchKey: getSearchKey)
       // activityIndicator.startAnimating()
      
    }
   
}
//MARK: - PictureManagerDelegate

extension PictureViewController: PictureManagerDelegate {
    func didSearchPicture(pictureList: [Picture]) {
        
        self.picList = pictureList
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.collectionView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
        activityIndicator.stopAnimating()
    }
}

extension PictureViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return picList.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictCell", for: indexPath as IndexPath) as! PictureCollectionViewCell
            let url = NSURL(string: (picList[indexPath.row]).previewURL)
            cell.picSetUp(picUrl: url! as URL)
            return cell
        }
    
}

