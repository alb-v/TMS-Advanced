//
//  LayoutProtocols.swift
//  TMS
//
//  Created by Alberto Volpe on 02/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit



/**
 Definizione delle proprietà e dei metodi utili alla realizzazione del layout di un singolo layer.
    - Author: Volpe Alberto
    - Version: 1.0 */
protocol Layout {
    
    /** Il numero di righe presenti nel layer. */
    var rows:Int { get set }
    
    /** Il numero di colonne presenti nel layer. */
    var cols:Int { get set }
    
    /** La grandezza di ogni quadrante. */
    var blockSize: CGSize { get set }
    
    /**
     Realizzazione della griglia all'interno del layer.
     - Important: Medoto da utilizzare solo durante il testing del parallax. Per ridurre il consumo di memoria la griglia non viene realizzata, è astratta. Inoltre, quando viene disegnata la griglia, gli elementi sui layer sottostanti al primo non sono interagibili.
     - Parameters:
        - blockSize: La grandezza di ogni quadrante.
        - rows: Il numero di righe.
        - cols: Il numero di colonne.
     - returns: La griglia formata da rows * cols quadranti.
     - Author: Volpe Alberto
     - Version: 1.0 */
    static func gridTexture(blockSize: CGSize, rows:Int, cols:Int) -> SKTexture?
}

