//
//  InteractionableElement.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

class InteractionableElement: SKSpriteNode, Scalable, Interactionable, AssociativeSound, Positionable, Readable {
    
    internal var tts = TextToSpeech()
    internal var hint: Text
    
    internal var audioStream: Player
    
    internal var transitionToOff = SKAction.init(named: Effects.transitionToOff.rawValue)!
    internal var transitionToOn = SKAction.init(named: Effects.transitionToOn.rawValue)!
    internal var defaultState = SKAction.init(named: Effects.defaultState.rawValue)!
    
    init(visual: Resource, hint: Text, scaleBy: CGFloat, associateSound sound: Resource, quadrant: Quadrant) {
        
        self.hint = hint
        
        let i = UIImage(visual)!
        
        audioStream = Player(sound, withVolume: Sound.volumOfThe(objectType: type(of: self)))
        super.init(texture: SKTexture(image: i),
                   color: SKColor.clear,
                   size: i.size)
        
        size = getScaled(size: i.size,
                         by: scaleBy)
        
        position = gridPosition(position: quadrant,
                                inLayer: Layer.ofThe(objectType: type(of:self))!)
        
        
        interactionDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
