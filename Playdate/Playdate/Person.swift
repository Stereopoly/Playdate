//
//  Person.swift
//  Playdate
//
//  Created by Oscar Bjorkman on 6/23/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit

class Person: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        Playdate1.drawPerson()
    }
    

}
