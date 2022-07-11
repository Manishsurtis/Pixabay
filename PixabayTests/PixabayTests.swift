//
//  PixabayTests.swift
//  PixabayTests
//
//  Created by Manish on 04/07/22.
//

import XCTest
@testable import Pixabay

class PixabayTests: XCTestCase {

    var vc : SearchPictureViewController!
    func test_buttonSearchTap(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut : SearchPictureViewController = sb.instantiateViewController(withIdentifier: String(describing: "SearchPictureVC")) as! SearchPictureViewController
        sut.loadViewIfNeeded()
        sut.btnSearch.sendActions(for: .touchUpInside)
    }
    override func tearDownWithError() throws {
        vc = nil
    }

    func test_ListApi_Getdata(){
        let PictureListVC : PictureViewController = PictureViewController()
        PictureListVC.getSearchKey = "flowers"
        guard  PictureListVC.getSearchKey.count > 0 else{
            XCTFail("Please enter search keyword")
            return
        }
        PictureListVC.get_Picture_List_APICall()
    }
}
