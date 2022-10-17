//
//  HomeViewController.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 15/10/22.
//


import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

enum UserDetailCell {
    
    case conctac
    case photo
    case service
    case location
}

class HomeViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let mCellTypes = [UserDetailCell.conctac, UserDetailCell.photo, UserDetailCell.service, UserDetailCell.location]
    
    var presenter: HomeViewToPresenterProtocol?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: Movies? = nil
    
    var image = UIImage()
    
    var ref: DocumentReference!
    var getRef: Firestore!
    
    
    var latitude: String = ""
    var longitude: String = ""
    var txtName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        configureTableView()
        
        self.getRef = Firestore.firestore()
        
    }
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
        self.tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        self.tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        self.tableView.register(UINib(nibName: "MapTableViewCell", bundle: nil), forCellReuseIdentifier: "MapTableViewCell")
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        self.showToast(message: "In process", font: .systemFont(ofSize: 12.0))
        
        print("IMAGE DATA --> \(image)")
        print("NAME  --> \(txtName)")
        print("LATITUDE  --> \(self.latitude)")
        print("LONGITUDE  --> \(self.longitude)")
        
        /* save image in firebase */
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
}

extension HomeViewController :  HomePresenterToViewProtocol {
    func dataMovies(data: Movies) {
        self.data = data
        self.tableView.reloadData()
    }
}
extension HomeViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else if indexPath.row == 1 {
            
            let viewController = TakePhotoViewController(nibName: "TakePhotoViewController", bundle: nil)
            
            viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(viewController, animated: true, completion: nil)
            
            
            
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            
        } else {
            
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:  nil)
    }
    
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellTypes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch mCellTypes[indexPath.row] {
        case .conctac:
            return cellContact(tableView: tableView, indexPath: indexPath)
        case .photo:
            return cellPhoto(tableView: tableView, indexPath: indexPath)
        case .service:
            return cellService(tableView: tableView, indexPath: indexPath)
        case .location:
            return cellMap(tableView: tableView, indexPath: indexPath)
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch mCellTypes[indexPath.row] {
        case .conctac:
            return 100.0
        case .photo:
            return 140.0
        case .service:
            return 350.0
        case .location:
            return 400.0
            
        }
    }
    
    
    private func cellContact(tableView: UITableView, indexPath: IndexPath) -> ContactTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath  ) as! ContactTableViewCell
        cell.selectionStyle = .none
        cell.configureCellContact(user: "")
        cell.delegate = self
        return cell
        
    }
    
    
    
    private func cellPhoto(tableView: UITableView, indexPath: IndexPath) -> PhotoTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath  ) as! PhotoTableViewCell
        cell.selectionStyle = .none
        cell.configureCellPhoto(user: "")
        return cell
    }
    
    
    
    
    private func cellService (tableView: UITableView, indexPath: IndexPath) -> ServiceTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath  ) as! ServiceTableViewCell
        
        if let dataMovie =  data?.results{
            cell.selectionStyle = .none
            cell.delegate = self
            cell.configureCellService(mov: dataMovie)
        }
        
        return cell
        
    }
    
    private func cellMap (tableView: UITableView, indexPath: IndexPath) -> MapTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath  ) as! MapTableViewCell
        cell.selectionStyle = .none
        cell.configureCellMap(user: "heyy")
        cell.saveDelegate = self
        cell.delegate = self
        return cell
        
    }
    
    
    
}


extension HomeViewController: delegateName {
    func saveName(name: String) {
        self.txtName = name
    }
}

extension HomeViewController: dataIndexDelegate {
    func sectionedIndex(obj: Movie) {
        
        self.presenter?.router?.prepareToGoToDetail(origin: self, data: obj)
    }
}


extension HomeViewController: AlertShower {
    func showAlert(sender: MapTableViewCell, title: String, descrip: String) {
        let alert = UIAlertController(title: title, message: descrip, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler:  nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: delegateSaveLocation  {
    func saveLocation(latitude: String, longitude: String) {
        let campo:  [String: Any] = ["userLatitude": latitude, "userLongitude": longitude]
        ref = getRef?.collection("usuario").addDocument(data: campo, completion: { (error) in
            if let error = error?.localizedDescription {
                print("An error occurred while saving the location ", error)
            } else {
                self.latitude = latitude
                self.longitude = longitude
                self.showToast(message: "Location stored", font: .systemFont(ofSize: 11.0))
                
            }
        })
    }
}
