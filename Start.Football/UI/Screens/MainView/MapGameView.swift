//
//  MapGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI
import MapKit

struct MapGameView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                MapView(checkpoints: appBinding.main.map.gamePoint)
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarTitle(Text("Start.Football"), displayMode: .large)
                    .navigationBarItems(trailing: Button(action: {
                        self.viewController?.dismiss(animated: true, completion: nil)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    )
            }
        }
    }
}


final class GamePoint: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?

    init(title: String?, coordinate: CLLocationCoordinate2D, subtitle: String?) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}

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

// MARK: Sheet View
private extension MapGameView {
    private var backgroundColor: some View {
        ZStack {
            Color.secondary
                .edgesIgnoringSafeArea(.all)
                .animation(.linear(duration: 10))
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}


struct MapGameView_Previews: PreviewProvider {
    static var previews: some View {
        MapGameView(appBinding: .constant(.init()))
    }
}
