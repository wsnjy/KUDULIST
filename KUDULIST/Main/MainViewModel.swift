//
//  MainViewModel.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import Foundation

struct MainViewModel {
    
    let dataList:[List]
    var numberOfList:Int{
        return dataList.count
    }
}
