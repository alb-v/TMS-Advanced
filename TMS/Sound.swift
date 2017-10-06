//
//  Sound.swift
//  TMS
//
//  Created by Alberto Volpe on 06/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

/** Indica le proprietà relative ai souni della storia.
    - Author: Volpe Alberto
    - Version: 1.0 */
enum Sound {
    
    /** Suono associativo. */
    case Associative
    
    /** Suono relativo al drag&drop. */
    case Draggable
    
    /** Suono dell'intera storia. */
    case Story
    
    /** Il volume del corrispettivo tipo di suono. */
    var volume: (Float) {
        switch self {
        case .Associative:
            return 1
        case .Draggable:
            return 1
        case .Story:
            return 0.5
        }
    }
    
    /**
     Indica il volume da impostare in base al tipo di oggetto.
     - Important: Viene restituito nil nel caso in cui il tipo di oggetto non ha un suo volume.
     - Author: Volpe Alberto
     - Version: 1.0
     - returns: Il volume relativo al tipo di oggetto o nil.
     - parameters:
        - o: Il tipo dell'oggetto di cui si vuole conoscere il volume sonoro.
     */
    static func volumOfThe<T>(objectType o: T.Type) -> Float? {
        switch o {
        case is DraggableElement.Type:
            return Sound.Draggable.volume
        case is InteractionableElement.Type:
            return Sound.Associative.volume
        case is Element.Type:
            return Sound.Associative.volume
        default:
            print("Sound Enumerator Error -> \(#function):\nNon è stato definito un volume per il suono associato a questo oggetto (\(o)).\n")
            return nil
        }
    }
}
