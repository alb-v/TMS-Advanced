//
//  Structs.swift
//  TellMeStories
//
//  Created by Alberto Volpe on 01/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import AVFoundation

/* Per migliorare le performance utilizzare SKTexture(image: ) al posto di SKTexture(imageNamed: ) */

class Background: SKSpriteNode {
    
    init(visual: Resource) {
        
        let i = UIImage(visual)!
        
        super.init(texture: SKTexture(image: i), color: SKColor.clear, size: UIScreen.main.bounds.size)
//        
//        // Rectangular physics body around the object
//        physicsBody = SKPhysicsBody(rectangleOf: frame.size)
//        
//        // Make it dynamic
//        physicsBody!.isDynamic = true
//        
//        // We don't want the object to fall of the screen
//        physicsBody!.affectedByGravity = false
//        
//        // Add some mass to it
//        physicsBody!.mass = 0.02
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

