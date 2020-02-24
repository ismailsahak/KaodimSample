//
//  HomeViewController.swift
//  KaodimSample
//
//  Created by Ismail Sahak on 23/02/2020.
//  Copyright © 2020 Ismail Sahak. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var viewModel: ServiceListViewModel!
    let disposeBag = DisposeBag()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        
        viewModel = ServiceListViewModel(endpoint: Endpoint.home, repository: ServiceTypeListRepository.shared)
        
        viewModel.list.drive(onNext: {[unowned self] (_) in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.isFetching.drive(activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel.error.drive(onNext: {[unowned self] (error) in
            self.infoLabel.isHidden = !self.viewModel.hasError
            self.infoLabel.text = error
        }).disposed(by: disposeBag)
        
        setupTableView()
    }
    
    private func setTitle() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "app-logo")
        imageView.image = logo
        self.navigationItem.titleView = imageView
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(UINib(nibName: "ServiceTypeCell", bundle: nil), forCellReuseIdentifier: "ServiceTypeCell")
        tableView.register(UINib(nibName: "ServiceTypeHeader", bundle: nil), forCellReuseIdentifier: "ServiceTypeHeader")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfServiceGroups
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfServiceTypes(index: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "ServiceTypeHeader") as! ServiceTypeHeader
        view.configure(label: viewModel.servicesGroupList[section].name)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ServiceTypeCell = tableView.dequeueReusableCell( withIdentifier: "ServiceTypeCell", for: indexPath) as! ServiceTypeCell
        cell.selectionStyle = .none
        cell.configure(serviceType: viewModel.servicesGroupList[indexPath.section].serviceTypes[indexPath.row])
        return cell
    }
}
