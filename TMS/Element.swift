//
//  Element.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

class Element: SKSpriteNode, Scalable, AssociativeSound, Positionable {
    
    internal var audioStream: Player?
    
    init(visual: Resource, scaleBy: CGFloat, associateSound sound: Resource, quadrant: Quadrant) {
        
        let i = UIImage(visual)!
        
        if !sound.nameOrURL.isEmpty {
            audioStream = Player(sound, withVolume: Sound.volumOfThe(objectType: type(of: self)))
        }else { audioStream = nil }
        
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
