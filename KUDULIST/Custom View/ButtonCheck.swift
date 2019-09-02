//
//  ButtonCheck.swift
//  KUDULIST
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import UIKit

class ButtonCheck: UIButton {

    override init(frame:CGRect) {
        
        let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        super.init(frame: frame)
        
        let iconNormal = UIImage(named: "icon_box")?.maskWithColor(color: .green)
        let iconSelected = UIImage(named: "icon_checkmark")
        setImage(iconNormal, for: .normal)
        setImage(iconSelected, for: .selected)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
