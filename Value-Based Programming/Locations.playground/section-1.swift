import UIKit
import MapKit
import XCPlayground // Required for XCPShowView

let frame = CGRect(x: 0, y: 0, width: 150, height: 150)
let mapView = MKMapView(frame: frame)
mapView.region.center.latitude = 37.3347606
mapView.region.center.longitude = -122.0548883
mapView.region.span.latitudeDelta = 0.00725
mapView.region.span.longitudeDelta = 0.00725

XCPShowView("mapview", mapView)
