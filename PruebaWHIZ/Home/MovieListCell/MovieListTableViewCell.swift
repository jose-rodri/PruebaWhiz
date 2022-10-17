//
//  MovieListTableViewCell.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 16/10/22.
//

import UIKit
import SDWebImage

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelImage: UIImageView!
    
    @IBOutlet weak var mView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        mView.layer.shadowColor = UIColor.gray.cgColor
        mView.layer.shadowOffset = CGSize.zero
        mView.layer.cornerRadius = 8.0
        mView.layer.shadowOpacity = 1.9
       
    }
    
    static var cellType: String {
        return String(describing: self)
    }
    
    func displayInformation(movie: Movie) {
        self.labelTitle.text = movie.originalTitle
        self.labelDescription.text  = movie.overview
        self.labelImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.labelImage.sd_setImage(with: URL(string: Constant.URL.urlImages+(movie.posterPath ?? "")))
        
    }
    
}
