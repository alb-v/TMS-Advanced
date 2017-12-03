//
//  Layers.swift
//  TMS
//
//  Created by Alberto Volpe on 02/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit

/** Indica le proprietà relative ai layer da inserire nella scena.
    - Author: Volpe Alberto
    - Version: 1.0 */
enum Layer: String {
    /** Layer distante. */
    case distant
    
    /** Layer intermedio. */
    case intermediate
    
    /** Layer più vicino. */
    case nearest
    
    /** La posizione sull'asse z del layer. */
    var zPosition: (CGFloat) {
        switch self {
        case .distant:
            return 0
        case .intermediate:
            return 1
        case .nearest:
            return 2
        }
    }
    
    /** Il numero di righe presenti in un layer. */
    var rows: (Int) {
        switch self {
        case .distant:
            return 19
        case .intermediate:
            return 9
        case .nearest:
            return 9
        }
    }
    
    /** Il numero di colonne presenti in un layer. */
    var columns: (Int) {
        switch self {
        case .distant:
            return 20
        case .intermediate:
            return 10
        case .nearest:
            return 10
        }
    }
    
    /** La grandezza dei quadranti presenti in un layer.*/
    var blockSize: (CGSize?) {
        switch self {
        case .distant:
            return CGSize(width: UIScreen.main.bounds.width / CGFloat(Layer.distant.columns),
                          height: UIScreen.main.bounds.width / CGFloat(Layer.distant.rows))
        case .intermediate:
            return CGSize(width: UIScreen.main.bounds.width / CGFloat(Layer.intermediate.columns),
                          height: UIScreen.main.bounds.width / CGFloat(Layer.intermediate.rows))
        case .nearest:
            return CGSize(width: UIScreen.main.bounds.width / CGFloat(Layer.nearest.columns),
                          height: UIScreen.main.bounds.width / CGFloat(Layer.nearest.rows))
        default:
            print("Layer Enumerator Error -> \(#function):\nNon conosco la blockSize del layer.\n")
            return nil
        }
    }
    
    /**
     Indica il layer della scena in cui aggiungere un nuovo oggetto.
     - Important: Viene restituito nil nel caso in cui il tipo di oggetto non è utilizzabile all'interno della scena.
     - Author: Volpe Alberto
     - Version: 1.0
     - returns: Il Layer in cui deve essere posizionato l'oggetto o nil.
     - parameters:
        - o: Il tipo dell'oggetto da aggiungere nella scena.
     */
    static func ofThe<T>(objectType o: T.Type) -> Layer? {
        switch o {
        case is DraggableElement.Type:
            return Layer.nearest
        case is InteractionableElement.Type:
            return Layer.intermediate //return Layer.nearest
        case is Element.Type:
            return Layer.intermediate
        case is BasicElement.Type:
            return Layer.distant
        case is Background.Type:
            return Layer.distant
        default:
            print("Layer Enumerator Error -> \(#function):\nL'oggetto non è presente nell'elenco di quelli utilizzabili nei layer della scena.\n")
            return nil
        }
    }
}
