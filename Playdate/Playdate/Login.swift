//
//  Login.swift
//  
//
//  Created by Oscar Bjorkman on 5/22/15.
//
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
