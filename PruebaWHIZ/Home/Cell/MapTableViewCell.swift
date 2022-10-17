//
//  MapTableViewCell.swift
//  PruebaWHIZ
//
//  Created by Quispe Rodriguez, Jose Leoncio on 16/10/22.
//

import UIKit
import MapKit

protocol delegateSaveLocation: class {
    
    func saveLocation(latitude: String, longitude: String)
}

protocol AlertShower{
    func showAlert(sender: MapTableViewCell, title: String, descrip: String)
}
class MapTableViewCell: UITableViewCell {

    weak var saveDelegate: delegateSaveLocation?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var iconLocation: UIImageView!
    
    
    let locationManager = CLLocationManager()
    var delegate: AlertShower?
    
    var latitud: Double = 0.0
    var logitud: Double = 0.0
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mapView.showsUserLocation = true
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.startUpdatingLocation()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(locationTapped(tapGestureRecognizer:)))
        iconLocation.isUserInteractionEnabled = true
        iconLocation.addGestureRecognizer(tapGestureRecognizer)
        
      
        
        let tapGestureLocation = UITapGestureRecognizer(target: self, action:  #selector(self.gestureAction(tapGestureRecognizer:)))
        mapView.addGestureRecognizer(tapGestureLocation)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func locationTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        initLocation()
    }
    
    func initLocation() {
        let permis =  CLLocationManager.authorizationStatus()
        if permis == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if permis == .denied {
            self.delegate?.showAlert(sender: self, title: "Error de localización", descrip: "Localización denegada")
        } else if permis == .restricted  {
            self.delegate?.showAlert(sender: self, title: "Error de localización", descrip: "Localización restringida")
        } else {
            guard let currectCoordinate = locationManager.location?.coordinate else {
                return
            }
            
            
            let latitudinalMeters: CLLocationDistance = 500
            let longitudinalMeters: CLLocationDistance = 500
            print("latitud: \(latitud) logitud: \(logitud)")
            self.saveDelegate?.saveLocation(latitude: self.latitud.description, longitude: self.logitud.description)
            let region = MKCoordinateRegion(center: currectCoordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
            mapView.setRegion(region, animated: true)
            
        }
    }
    
 
    @objc func gestureAction(tapGestureRecognizer: UITapGestureRecognizer) {
        self.mapView.removeAnnotations(mapView.annotations)
        let touchPoint = tapGestureRecognizer.location(in:  mapView)
        let newCoord = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoord
        mapView.addAnnotation(annotation)
    }
    
    
    func configureCellMap(user: String) {
        
    }
}


extension MapTableViewCell: CLLocationManagerDelegate {
   
        
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error Location")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        let userCoord = newLocation.coordinate
        let latitud = Double(userCoord.latitude)
        let logitud = Double(userCoord.longitude)
        self.latitud =  Double(userCoord.latitude)
        self.logitud =   Double(userCoord.longitude)
       
    }
    
}

extension MapTableViewCell: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let ping = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        return ping
    }
    
    
    
}
