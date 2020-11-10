//
//  MainViewController.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit
import MapKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    @IBOutlet weak var customView: MainView!
    
    var locationService: LocationServiceProtocol
    var viewModel: MainViewModelProtocol
    var router: MainRouterProtocol
    var pizzaDataSource: PizzaDataSourceProtocol
    var pizzaDelegate: PizzaDelegateProtocol
    
    init(locationService: LocationServiceProtocol,
         router: MainRouterProtocol,
         viewModel: MainViewModelProtocol,
         pizzaDataSource: PizzaDataSourceProtocol,
         pizzaDelegate: PizzaDelegateProtocol,
         coder: NSCoder) {
        self.locationService = locationService
        self.router = router
        self.viewModel = viewModel
        self.pizzaDelegate = pizzaDelegate
        self.pizzaDataSource = pizzaDataSource
        super.init(coder: coder)!
    }
    
    override func loadView() {
        super.loadView()
        self.customView.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        getLocation()
    }
    
}
private extension MainViewController {
    func bind() {
        self.customView.tableView.dataSource = self.pizzaDataSource
        self.customView.tableView.delegate = self.pizzaDelegate
        self.viewModel.places.bind {[weak self] (places) in
            guard let self = self else { return }
            self.customView.tableView.reloadData()
            places.forEach {
                self.add(place: $0)
            }
        }
    }
    func getLocation() {
        self.locationService.location.bind {[weak self] (location) in
            guard let self = self, let location = location else { return }
            let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
            self.customView.mapView.centerToLocation(initialLocation)
            self.viewModel.getPlaces(lat: "\(location.latitude)", lon: "\(location.longitude)")
        }
        self.locationService.getCurrentLocation()
    }
    func add(place: PizzaVenue) {
        let annotation = MKPointAnnotation()
        annotation.title = place.venue.name
        annotation.subtitle = place.venue.location.address
        let center = CLLocationCoordinate2D(latitude: place.venue.location.lat, longitude: place.venue.location.lng)
        annotation.coordinate = center
        self.customView.mapView.addAnnotation(annotation)
    }
}
