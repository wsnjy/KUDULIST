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
    func doneAction(index:Int)
}

class MainPresenter {

    var wireFrame:MainWireframe?
    var view:MainController?
    var lists = [List]()
    
    init() {
        wireFrame = MainWireframe()
        wireFrame?.presenter = self
    }
        
}

extension MainPresenter: MainPresenterProtocol {
    
    func doneAction(index: Int) {
        let newList = modifyList(index)
        let viewModel = MainViewModel(dataList:newList)
        view?.reloadData(viewModel)
    }
    
    func receiveNewList(_ text: String) {
        guard text.count > 0 else {
            return
        }
        
        let newList = generateNewList(text)
        lists.append(newList)
        let viewModel = MainViewModel(dataList: lists)
        view?.reloadData(viewModel)
    }
    
    func showAlertNewList() {
        if let view = view{
            wireFrame?.alertAddToDoList(view)
        }
    }
}

extension MainPresenter {
    
    func modifyList(_ index:Int) -> [List] {
        var list = lists[index]
        list.isDone = !list.isDone
        lists[index] = list
        return lists
    }
    
    func generateNewList(_ text:String) -> List {
        return List(id: getID(), toDo: text, isDone: false)
    }
    
    func getID() -> Int {
        return lists.count + 1
    }
    
}
