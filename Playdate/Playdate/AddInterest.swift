//
//  AddInterest.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 5/26/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class AddInterest: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        Playdate1.drawAddInterest(frame: self.bounds)
    }
    

}
