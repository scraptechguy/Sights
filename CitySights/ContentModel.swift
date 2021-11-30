//
//  ContentModel.swift
//  CitySights
//
//  Created by Rostislav Brož on 11/28/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    
    override init() {
        
        // init method of NSObject
        
        super.init()
        
        
        // Set content model as the delegate of the location manager
        
        locationManager.delegate = self
        
        
        // Request permission from the user
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    // Location manager delegate methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Update the authorizationState var
        
        authorizationState = locationManager.authorizationStatus
        
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // Permission granted, all good ->
            // Start geolocating the user
            
            locationManager.startUpdatingLocation()
        }
        
        else if locationManager.authorizationStatus == .denied {
            
            // We need permission in order for the app to work as intended
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        
        let userLocation = locations.first
        
        
        /* print that prints out the location passed, just for debugging
         
        print(locations.first ?? "no location")
         
        */
        
        
        if userLocation != nil {
            
            // Stop requesting the location after we get it once
            
            locationManager.stopUpdatingLocation()
            
            
            // If we have the coordinates of the user, send it to the Yelp API
        }
    }
    
    func getBusinesses(category:String, location: CLLocation) {
        
    }
}
