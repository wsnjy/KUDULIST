//
//  ViewController.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import UIKit

protocol MainControllerProtocol {
    func reloadData(_ viewModel:MainViewModel)
}

class MainController: BaseController {

    var presenter:MainPresenter?
    var viewModel:MainViewModel?
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.estimatedRowHeight = 65
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()

    lazy var button:UIButton = {
        let icon = UIImage(named: "icon_add")
        let view = UIButton()
        view.setImage(icon, for: .normal)
        view.imageView?.contentMode = UIView.ContentMode.scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(add), for:.touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter?.view = self
    }
    
    override func setupView() {
        
        title = "KUDU LIST"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 65).isActive = true
        button.heightAnchor.constraint(equalToConstant: 65).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44).isActive = true
        
    }
    
    @objc private func add() {
        presenter?.showAlertNewList()
    }

}

extension MainController: MainControllerProtocol{
    
    func reloadData(_ viewModel:MainViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfList ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel?.dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = item
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        return cell
    }
    
}
