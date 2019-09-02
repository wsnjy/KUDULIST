//
//  MainPresenter.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol {
    func showAlertNewList()
    func receiveNewList(_ text:String)
}

class MainPresenter {

    var wireFrame:MainWireframe?
    var view:MainController?
    var lists = [String]()
    
    init() {
        wireFrame = MainWireframe()
        wireFrame?.presenter = self
    }
        
}

extension MainPresenter: MainPresenterProtocol {
    
    func receiveNewList(_ text: String) {
        guard text.count > 0 else {
            return
        }
        lists.append(text)
        let viewModel = MainViewModel(dataList: lists)
        view?.reloadData(viewModel)
    }
    
    func showAlertNewList() {
        if let view = view{
            wireFrame?.alertAddToDoList(view)
        }
    }
}

struct MainViewModel {
    
    let dataList:[String]
    
    var numberOfList:Int{
        return dataList.count
    }
}
