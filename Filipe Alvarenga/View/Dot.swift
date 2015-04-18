//
//  Dot.swift
//  Filipe Alvarenga
//
//  Created by Filipe Alvarenga on 17/04/15.
//  Copyright (c) 2015 Filipe Alvarenga. All rights reserved.
//

import UIKit

/**
    Dot view class.
*/

@IBDesignable class Dot: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.height / 2
    }

}
