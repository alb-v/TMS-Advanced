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
    Put .remote....there is .project only for demo purpose
 */
open class StoryScene: SKScene, Parallax, Objects {
    
    /* Parallax vars */
    internal var distantLayer: SKSpriteNode?
    internal var intermediateLayer: SKSpriteNode?
    internal var nearestLayer: SKSpriteNode?
    static internal let motionManager = CMMotionManager()
    internal var language: String?
    
    public var tView: UITextView!
    public var sceneViewController: UIViewController?
    
    func add(Text t: String) {
        tView.text.append(t+"\n")
        tView.scrollRangeToVisible(NSMakeRange(tView.text.count-2, 0))
    }
    
    override open func didMove(to view: SKView) { }
    
    open func create(s: SceneData, language: String) {
       
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
        
        self.language = language
        background(visual: Resource(location: .remote, nameOrURL: s.background!))
        add(Text: s.hint.value[language]!)
        
        for b in s.basicElements {
            basicElement(visual: Resource(location: .remote, nameOrURL: b.visual),
                         scaleBy: 1,
                         quadrant: b.position)
        }
        
        for e in s.elements {
            element(visual: Resource(location: .remote, nameOrURL: e.visual),
                    scaleBy: 1,
                    associateSound: Resource(location: .remote, nameOrURL: e.sound),
                    quadrant: e.position)
        }
        
        for i in s.interactionableElements {
            interactionableElement(visual: Resource(location: .remote, nameOrURL: i.visual),
                                   nextSceneID: i.nextSceneID,
                                   scaleBy: 1,
                                   hint: i.hint,
                                   associateSound: Resource(location: .remote, nameOrURL: i.sound),
                                   quadrant: i.position)
        }
        
        for d in s.draggableElements {
            draggableElement(visual: Resource(location: .remote, nameOrURL: d.visual),
                             nextSceneID: d.nextSceneID,
                             scaleBy: 1,
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
                
                let hintToRead = (node as! InteractionableElement).hint.value[language!]!
                (node as! Readable).read(text: hintToRead, langauge: language!)
                add(Text: hintToRead)
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
                
                var hintToRead = ""
                if (node as! Draggable).checkPosition() {
                 hintToRead = (node as! DraggableElement).hintOnSuccess.value[language!]!
                }else{
                  hintToRead = (node as! DraggableElement).hintOnFailure.value[language!]!
                }
                
                (node as! Readable).read(text: hintToRead, langauge: language!)
                add(Text: hintToRead)
            case is InteractionableElement:
                (node as! Interactionable).interactionEnd()
                if let nextSceneID = (node as! Interactionable).nextSceneID {
                    (sceneViewController as! StoryBoard).openScene(ID: nextSceneID)
                }
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
