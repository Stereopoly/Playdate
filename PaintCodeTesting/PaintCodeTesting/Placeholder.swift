//
//  Placeholder.swift
//  PaintCodeTesting
//
//  Created by Oscar Bjorkman on 5/21/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class Placeholder: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        Playdate1.drawPerson(frame: self.bounds)
        
    }
    

}
