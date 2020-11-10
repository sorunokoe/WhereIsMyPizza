//
//  PizzaDetailViewController.swift
//  WhereIsMyPizza
//
//  Created by Yeskendir Salgara on 11/10/20.
//

import UIKit

class PizzaDetailViewController: UIViewController, PizzaDetailViewControllerProtocol {
    
    @IBOutlet weak var customView: PizzaDetailView!
    var router: PizzaDetailRouterProtocol
    var viewModel: PizzaDetailViewModelProtocol
    
    init(router: PizzaDetailRouterProtocol,
         viewModel: PizzaDetailViewModelProtocol,
         coder: NSCoder) {
        self.router = router
        self.viewModel = viewModel
        super.init(coder: coder)!
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        self.customView.configureViews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.dataSource = self
    }
}
extension PizzaDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return PizzaDetailDataSource.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = PizzaDetailDataSource.sections[indexPath.section]
        let id = PizzaDetailView.Identifier.titleCellId.rawValue
        if let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? TitleCell {
            switch section {
            case .name:
                let font = UIFont.systemFont(ofSize: 18, weight: .medium)
                cell.set(font: font, text: self.viewModel.place.venue.name)
            case .adress:
                let font = UIFont.systemFont(ofSize: 16, weight: .regular)
                cell.set(font: font, text: self.viewModel.place.venue.location.address)
            case .city:
                let font = UIFont.systemFont(ofSize: 14, weight: .regular)
                cell.set(font: font, text: self.viewModel.place.venue.location.city)
            case .state:
                let font = UIFont.systemFont(ofSize: 14, weight: .regular)
                cell.set(font: font, text: self.viewModel.place.venue.location.state)
            }
            return cell
        }
        return UITableViewCell()
    }
}
