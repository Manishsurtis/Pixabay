//
//  PictureModel.swift
//  Pixabay
//
//  Created by Manish on 10/06/22.
//

import Foundation


struct PictureModel : Codable{
    let total : Double
    let totalHits : Double
    let hits : [Picture]
}

struct  Picture : Codable {
    let pageURL: String
    let type : String
    let previewURL : String
}

