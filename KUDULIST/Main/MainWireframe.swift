//
//  MainWireframe.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import UIKit

protocol MainWireframeProtol {
    func alertAddToDoList(_ nav:MainController)
}

class MainWireframe: MainWireframeProtol{
    
    var presenter:MainPresenter?
    
    func alertAddToDoList(_ vc: MainController) {
        
        let alert = UIAlertController(title: "What to do?", message: "", preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = ""
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "Add", style: .default, handler: {_ in
            guard let textField = alert.textFields?.first else { return }
            self.handleNewList(textField.text ?? "")
        })
        
        alert.addAction(cancel)
        alert.addAction(add)
        vc.present(alert, animated: true, completion:nil)
        
    }
    
    private func handleNewList(_ list:String){
        presenter?.receiveNewList(list)
    }
    
}
