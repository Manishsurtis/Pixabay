//
//  PictureCollectionViewCell.swift
//  Pixabay
//
//  Created by Manish on 10/06/22.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    func picSetUp(picUrl : URL){
        if let data = try? Data(contentsOf: picUrl as URL) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.pictureImageView.image = image
                            }
                        }
        }
    }
    
}
