// DynamicMapHotels/ViewController.swift
import UIKit
import MapKit

class HotelAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let price: Int

    init(hotel: Hotel) {
        self.coordinate = CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude)
        self.title = "\u{20B9}\(hotel.price)"
        self.price = hotel.price
    }
}


class AppleMapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    var allHotels: [Hotel] = []
    var regionChangeWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupInitialRegion()
        loadSampleHotels()
    }

    func setupInitialRegion() {
        let coordinate = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }

    func loadSampleHotels() {
        allHotels = [
            Hotel(name: "Treebo Global Stay", price: 1972, latitude: 12.9352, longitude: 77.6141),
            Hotel(name: "Blue Moon Residency", price: 2400, latitude: 12.942, longitude: 77.628),
            Hotel(name: "Green Field Inn", price: 1105, latitude: 12.9600, longitude: 77.6200),
            Hotel(name: "Comfort Space", price: 5670, latitude: 12.9950, longitude: 77.6400),
            Hotel(name: "Budget Stay", price: 795, latitude: 12.9760, longitude: 77.5710)
        ]

        updateVisibleAnnotations()
    }

    func updateVisibleAnnotations() {
        let center = mapView.region.center
        let span = mapView.region.span

        let topLeft = CLLocationCoordinate2D(
            latitude: center.latitude + span.latitudeDelta / 2,
            longitude: center.longitude - span.longitudeDelta / 2
        )

        let bottomRight = CLLocationCoordinate2D(
            latitude: center.latitude - span.latitudeDelta / 2,
            longitude: center.longitude + span.longitudeDelta / 2
        )

        let hotelsInRegion = allHotels.filter { hotel in
            hotel.latitude <= topLeft.latitude &&
            hotel.latitude >= bottomRight.latitude &&
            hotel.longitude >= topLeft.longitude &&
            hotel.longitude <= bottomRight.longitude
        }

        mapView.removeAnnotations(mapView.annotations)

        for hotel in hotelsInRegion {
            let annotation = HotelAnnotation(hotel: hotel)
            mapView.addAnnotation(annotation)
        }
    }
}

extension AppleMapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        regionChangeWorkItem?.cancel()
        regionChangeWorkItem = DispatchWorkItem(block: {
            self.updateVisibleAnnotations()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: regionChangeWorkItem!)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let hotelAnnotation = annotation as? HotelAnnotation else { return nil }

        let identifier = "HotelPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }

        annotationView?.markerTintColor = .systemBlue
        annotationView?.glyphText = "\u{20B9}\(hotelAnnotation.price)"

        return annotationView
    }
}

