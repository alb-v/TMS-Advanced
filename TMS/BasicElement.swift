//
//  BasicElement.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import UIKit
import SpriteKit

class BasicElement: SKSpriteNode, Scalable, Positionable {
    
    init(visual: Resource, scaleBy: CGFloat, quadrant: Quadrant) {
        
        
        let i = UIImage(visual)!
        
        super.init(texture: SKTexture(image: i),
                   color: SKColor.clear,
                   size: i.size)
        
        size = getScaled(size: i.size,
                         by: scaleBy)
        
        position = gridPosition(position: quadrant,
                                inLayer: Layer.ofThe(objectType: type(of:self))!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
