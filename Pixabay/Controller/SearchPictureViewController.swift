//
//  SearchPictureViewController.swift
//  Pixabay
//
//  Created by Manish on 10/06/22.
//

import UIKit

class SearchPictureViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSearch.layer.cornerRadius = 10
        
    }

}

//MARK: - UITextFieldDelegate

extension SearchPictureViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        guard (searchTextField?.text)!.count > 0 else{
            Alert.show(Constant.appName, message: AlertMsg.emptySearchKey, onVC: self)
            return
        }
     
        let PictureVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PictureVC") as! PictureViewController
            PictureVC.getSearchKey = searchTextField.text!
            self.navigationController?.pushViewController(PictureVC, animated: true)
            searchTextField.endEditing(true)
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
}
