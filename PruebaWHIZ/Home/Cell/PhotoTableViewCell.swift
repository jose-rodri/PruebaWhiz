//
//  PhotoTableViewCell.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 16/10/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var mview: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }

    func configureView() {
        mview.layer.shadowColor = UIColor.gray.cgColor
        mview.layer.shadowOffset = CGSize.zero
        mview.layer.cornerRadius = 8.0
        mview.layer.shadowOpacity = 1.9
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellPhoto(user: String) {
        
    }
}
