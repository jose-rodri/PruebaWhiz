//
//  TakePhotoViewController.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 16/10/22.
//

import UIKit

class TakePhotoViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    

    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var icCamera: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        icCamera.isUserInteractionEnabled = true
        icCamera.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
        
        // Your action
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
              image = pickedImage
              self.profilePicture.image = pickedImage
              print("image====> \(image)")
          }
          
          dismiss(animated: true, completion: nil)
      }
      
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:  nil)
    }
    
    
    @IBAction func buttonClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
