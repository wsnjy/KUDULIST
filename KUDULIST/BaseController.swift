//
//  BaseController.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import UIKit

protocol BaseControllerProtocol {
    func controllerDidFetch()
    func controllerDidError()
    func controllerDidEmpty()
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView(){}

}

extension BaseController: BaseControllerProtocol {
    @objc func controllerDidFetch() {}
    
    @objc func controllerDidError() {}
    
    @objc func controllerDidEmpty() {}
}
