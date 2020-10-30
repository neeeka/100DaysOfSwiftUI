//
//  MapView.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 27/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    var annotation: MKPointAnnotation?
    
   func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
    if let annotation = annotation {
        mapView.setCenter(annotation.coordinate, animated: false)
    }
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if let annotation = annotation {
            view.removeAnnotations(view.annotations)
            view.addAnnotation(annotation)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         
            let identifier = "Placemark"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}
