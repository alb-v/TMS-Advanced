//
//  StoryScene.swift
//  TMS
//
//  Created by Alberto Volpe on 09/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import CoreMotion

/**
    - Important: Se vuoi utilizzare questa classe, crea un file SpriteKit Scene nel progetto e nel custom class inspector indica i seguenti parametri: 
 
            CustomClass: StoryScene (Il nome di questa classe)
            Module: TMS (il nome del framework)
 */
open class StoryScene: SKScene, Parallax, Objects {
    
    /* Parallax vars */
    internal var distantLayer: SKSpriteNode?
    internal var intermediateLayer: SKSpriteNode?
    internal var nearestLayer: SKSpriteNode?
    static internal let motionManager = CMMotionManager()
    
    override open func didMove(to view: SKView) {
        
        distantLayer = SKSpriteNode(color: SKColor.clear,
                                    size: Layer.distant.blockSize!)
        
        intermediateLayer =  SKSpriteNode(color: SKColor.clear,
                                          size: Layer.intermediate.blockSize!)
        
        nearestLayer =  SKSpriteNode(color: SKColor.clear,
                                     size: Layer.nearest.blockSize!)
        
        setSceneWithParallax()
        
        addChild(distantLayer!)
        addChild(intermediateLayer!)
        addChild(nearestLayer!)
    }
    
    open func create(s: SceneData) {
        
        background(visual: Resource(location: .project, nameOrURL: s.background!))
        
        for b in s.basicElements {
            basicElement(visual: Resource(location: .remote, nameOrURL: b.visual),
                         scaleBy: 0.1,
                         quadrant: b.position)
        }
        
        for e in s.elements {
            element(visual: Resource(location: .remote, nameOrURL: e.visual),
                    scaleBy: 0.1,
                    associateSound: Resource(location: .remote, nameOrURL: e.sound),
                    quadrant: e.position)
        }
        
        for i in s.interactionableElements {
            interactionableElement(visual: Resource(location: .remote, nameOrURL: i.visual),
                                   scaleBy: 0.1,
                                   hint: i.hint,
                                   associateSound: Resource(location: .remote, nameOrURL: i.sound),
                                   quadrant: i.position)
        }
        
        for d in s.draggableElements {
            draggableElement(visual: Resource(location: .remote, nameOrURL: d.visual),
                             scaleBy: 0.01,
                             hintOnSuccess: d.hintOnSuccess,
                             hintOnFailure: d.hintOnFailure,
                             originalQuadrant: d.position,
                             destinationQuadrant: d.destination)
        }
    }
    
    deinit {
        print("La scena \(type(of:self)) è stata rimossa dalla memoria (DEINIT)")
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is InteractionableElement:
                (node as! Interactionable).interactionBegan()
                (node as! AssociativeSound).play()
            case is DraggableElement:
                (node as! Interactionable).interactionBegan()
                (node as! DraggableSound).playDrag()
            case is Element:
                (node as! AssociativeSound).play()
            default:
                break
            }
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is DraggableElement:
                (node as! Interactionable).interactionEnd()
                (node as! DraggableSound).playDrop()
                (node as! Draggable).checkPosition()
            case is InteractionableElement:
                (node as! Interactionable).interactionEnd()
            default:
                break
            }
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesMoved(touches, with: event)
        for t in touches {
            let location = t.location(in: self)
            let node = self.atPoint(location)
            
            switch node {
            case is DraggableElement:
                (node as! Draggable).move(atPosition: location)
            default:
                break
            }
        }
    }
    
    override open func update(_ currentTime: CFTimeInterval) {}
}
