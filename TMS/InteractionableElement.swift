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
    public var hint: Text
    
    internal var audioStream: Player?
    internal var nextSceneID: String?
    
    internal var transitionToOff = SKAction.init(named: Effects.transitionToOff.rawValue)!
    internal var transitionToOn = SKAction.init(named: Effects.transitionToOn.rawValue)!
    internal var defaultState = SKAction.init(named: Effects.defaultState.rawValue)!
    
    init(visual: Resource, nextSceneID: String?, hint: Text, scaleBy: CGFloat, associateSound sound: Resource, quadrant: Quadrant) {
        
        self.hint = hint
        self.nextSceneID = nextSceneID
        
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
        
        
        interactionDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
