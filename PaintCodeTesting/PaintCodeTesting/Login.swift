//
//  Login.swift
//  PaintCodeTesting
//
//  Created by Oscar Bjorkman on 5/21/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class Login: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        Playdate1.drawLogin(frame: self.bounds)
    }
    

}
