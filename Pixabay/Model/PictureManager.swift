//
//  PictureManager.swift
//  Pixabay
//
//  Created by Manish on 10/06/22.
//

import Foundation

protocol PictureManagerDelegate {
    func didSearchPicture(pictureList : [Picture])
    func didFailWithError(error: Error)
}

struct PictureManager {
    let pictureURL = APIList.imageListAPI
    
    var delegate: PictureManagerDelegate?
    
    func fetchpicture(searchKey: String) {
        let urlString = "\(pictureURL)&q=\(searchKey)&image_type=photo"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                do{
                let result = try JSONDecoder().decode(PictureModel.self, from: data!)
                    delegate?.didSearchPicture(pictureList: result.hits)
                }catch{
                    delegate?.didFailWithError(error: error)
                    return
                }
            }
            task.resume()
        }
    }
}


