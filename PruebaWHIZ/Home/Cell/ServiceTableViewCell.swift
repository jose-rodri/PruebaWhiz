//
//  ServiceTableViewCell.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 16/10/22.
//

import UIKit

protocol dataIndexDelegate: class {
    func sectionedIndex(obj: Movie)
}

class ServiceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    weak var delegate: dataIndexDelegate?
    
    var movieData: [Movie] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nibTable = UINib(nibName: MovieListTableViewCell.cellType, bundle: nil)
        tableView.register( nibTable, forCellReuseIdentifier: MovieListTableViewCell.cellType)
      
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    
    func configureCellService(mov: [Movie]) {
        self.movieData = mov
        print("mov==> \(mov)")
       
      
        tableView.reloadData()
       
       
    }
}


extension ServiceTableViewCell: UITableViewDelegate {
    
}

extension ServiceTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
   }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return movieData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.cellType, for: indexPath ) as?
                MovieListTableViewCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        
        cell.displayInformation(movie: movieData[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        self.delegate?.sectionedIndex(obj: movieData[indexPath.row])
    }
    
}

