//
//  APIList.swift
//  Candyspace
//
//  Created by Manish on 12/05/22.
//

import Foundation

class APIList: NSObject {
    // Main URL
    static var apiURL: String = "https://pixabay.com/api/"
    
    static var imageListAPI: String = "\(APIList.apiURL)?key=\(Constant.APIKEY)"

}
