//
//  ContactTableViewCell.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//

import UIKit
protocol delegateName: class {
    func saveName(name: String)
}

class ContactTableViewCell: UITableViewCell, UITextFieldDelegate, UITextViewDelegate {
    
    static var statimaredHeight: CGFloat = 250.0
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var txtName: UITextField!
    
    
    weak var delegate: delegateName?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
        txtName.delegate = self
       

    }
    
  
    
    func configureView() {
        mView.layer.shadowColor = UIColor.gray.cgColor
        mView.layer.shadowOffset = CGSize.zero
        mView.layer.cornerRadius = 8.0
        mView.layer.shadowOpacity = 1.9
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCellContact(user: String) {
        
    }
  
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtName {
           
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            self.delegate?.saveName(name: txtName.text ?? "")
           
            return alphabet
            
            
        } else {
            return false
        }
    }
   
    
}


