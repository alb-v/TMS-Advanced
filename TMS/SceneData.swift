//
//  SceneData.swift
//  TMS
//
//  Created by Alberto Volpe on 28/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

public struct SceneData {
    
    public var title = Text()
    public var background: String?
    
    var hint = Text()
    
    var elements = [ElementData]()
    var basicElements = [BasicElementData]()
    var interactionableElements = [InteractionableData]()
    var draggableElements = [DraggableData]()
}

protocol VisualDataProtocol {
    var visual: String { get set }
}

protocol PositionableDataProtocol {
    var position: Quadrant { get set }
}

protocol SoundDataProtocol  {
    var sound: String { get set }
}

protocol DraggableDataProtocol {
    var hintOnFailure: Text { get set }
    var hintOnSuccess: Text { get set }
}

struct BasicElementData: VisualDataProtocol, PositionableDataProtocol  {
    
    var visual: String
    var position: Quadrant
}


struct ElementData: VisualDataProtocol, PositionableDataProtocol, SoundDataProtocol {
    
    var visual: String
    var position: Quadrant
    var sound: String
}

struct InteractionableData: VisualDataProtocol, PositionableDataProtocol, SoundDataProtocol {
    
    var visual: String
    var position: Quadrant
    var sound: String
    var hint: Text
}

struct DraggableData: VisualDataProtocol, PositionableDataProtocol, DraggableDataProtocol {
    
    var hintOnFailure: Text
    var hintOnSuccess: Text
    var visual: String
    var position: Quadrant
    var destination: Quadrant
}
