//
//  MapView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 24.01.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var checkpoints: [GamePoint]
    var mapView = MKMapView()
    var locationManager = CLLocationManager()
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.901587, longitude: 37.421388), latitudinalMeters: 9000, longitudinalMeters: 9000)
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow

        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.addAnnotations(checkpoints)
        mapView.region = region
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(checkpoints: self.$checkpoints,
                           mapView: self.mapView,
                           locationManager: self.locationManager)
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {
        @Binding var checkpoints: [GamePoint]
        var mapView: MKMapView
        var locationManager: CLLocationManager
        let annotationIdentifier = "annotationIdentifier"
        var incomeSegueIdentifier = ""
        
        
        init(checkpoints: Binding<[GamePoint]>, mapView: MKMapView, locationManager: CLLocationManager) {
            self._checkpoints = checkpoints
            self.mapView = mapView
            self.locationManager = locationManager
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else { return nil }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation,
                                                     reuseIdentifier: annotationIdentifier)
                annotationView?.canShowCallout = true
            }
            
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                imageView.layer.cornerRadius = 10
                imageView.clipsToBounds = true
                imageView.image = UIImage(named: "player2CG")
                annotationView?.rightCalloutAccessoryView = imageView
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
            renderer.strokeColor = .blue
            
            return renderer
        }
    }
}
