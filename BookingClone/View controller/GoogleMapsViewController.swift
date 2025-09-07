// DynamicMapHotels/ViewController.swift
import UIKit
import GoogleMaps

struct Hotel {
    let name: String
    let price: Int
    let latitude: Double
    let longitude: Double
}

class GoogleMapsViewController: UIViewController {
    
    @IBOutlet weak var mapContainerView: UIView!
    var mapView: GMSMapView!
    
    var allHotels: [Hotel] = []
    var markers: [GMSMarker] = []
    var cameraMoveTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogleMap()
        loadSampleHotels()
    }
    
    func setupGoogleMap() {
        // Set up the Google Maps camera
        let camera = GMSCameraPosition.camera(
            withLatitude: 12.9716,
            longitude: 77.5946,
            zoom: 12
        )
        
        // Create the map view
        mapView = GMSMapView.map(
            withFrame: mapContainerView.bounds,
            camera: camera
        )
        mapView.delegate = self
        mapContainerView.addSubview(mapView)
        
        // Auto-resize map when container size changes
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: mapContainerView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: mapContainerView.trailingAnchor)
        ])
    }
    
    func loadSampleHotels() {
        allHotels = [
            Hotel(name: "Treebo Global Stay", price: 1972, latitude: 12.9352, longitude: 77.6141),
            Hotel(name: "Blue Moon Residency", price: 2400, latitude: 12.942, longitude: 77.628),
            Hotel(name: "Green Field Inn", price: 1105, latitude: 12.9600, longitude: 77.6200),
            Hotel(name: "Comfort Space", price: 5670, latitude: 12.9950, longitude: 77.6400),
            Hotel(name: "Budget Stay", price: 795, latitude: 12.9760, longitude: 77.5710)
        ]
        
        updateVisibleMarkers()
    }
    
    func updateVisibleMarkers() {
        // Clear all existing markers
        mapView.clear()
        markers.removeAll()
        
        // Get current map bounds
        let visibleRegion = mapView.projection.visibleRegion()
        let bounds = GMSCoordinateBounds(region: visibleRegion)
        
        // Filter hotels within visible bounds
        let hotelsInRegion = allHotels.filter { hotel in
            bounds.contains(CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude))
        }
        
        // Add markers for hotels in visible region
        for hotel in hotelsInRegion {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude)
            
            let imageView = UIImageView(image: UIImage(named: "hotel"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            imageView.contentMode = .scaleAspectFit

            marker.iconView = imageView
            
            marker.title = hotel.name
            marker.snippet = "₹\(hotel.price)"
            marker.userData = hotel
            marker.map = mapView
            markers.append(marker)
        }
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        updateVisibleMarkers()
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        // Cancel any pending updates when user starts moving the map
        cameraMoveTimer?.invalidate()
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        // Use a timer to debounce rapid camera changes
        cameraMoveTimer?.invalidate()
        cameraMoveTimer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { [weak self] _ in
            self?.updateVisibleMarkers()
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        guard let hotel = marker.userData as? Hotel else { return nil }
        
        let infoWindow = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        infoWindow.backgroundColor = .white
        infoWindow.layer.cornerRadius = 6
        
        let priceLabel = UILabel()
        priceLabel.text = "₹\(hotel.price)"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .systemBlue
        
        let nameLabel = UILabel()
        nameLabel.text = hotel.name
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        
        let stackView = UIStackView(arrangedSubviews: [priceLabel, nameLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        infoWindow.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: infoWindow.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: infoWindow.centerYAnchor)
        ])
        
        return infoWindow
    }
}
