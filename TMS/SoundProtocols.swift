//
//  SoundProtocols.swift
//  TMS
//
//  Created by Alberto Volpe on 01/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import AVFoundation


/** Definizione delle proprietà e dei metodi utili alla riproduzione di una traccia sonora.
    - Author: Volpe Alberto
    - Version: 1.0 */
protocol Playable {
    
    /** Player da eseguire. */
    var audioStream: Player { get set }
    
    /**
     Riproduce la traccia sonora.
     - Author: Volpe Alberto
     - Version: 1.0 */
    func play()
    
    /**
     Ferma la riproduzione della traccia sonora.
     - Author: Volpe Alberto
     - Version: 1.0 */
    func pause()
    
    /**
     Termina la riproduzione della traccia sonora.
     - Author: Volpe Alberto
     - Version: 1.0 */
    func stop()
}



/** Definizione delle proprietà e dei metodi utili alla riproduzione degli effetti sonori relativi al drag&drop.
    - Author: Volpe Alberto
    - Version: 1.0 */
protocol DraggableSound  {
    
    /** Player da eseguire per il suono relativo al drag. */
    var audioStreamDrag: Player { get set }
    
    /** Player da eseguire per il suono relativo al drop. */
    var audioStreamDrop: Player { get set }
    
    /**
     Riproduce la traccia sonora relativa al drag.
     - Author: Volpe Alberto
     - Version: 1.0 */
    func playDrag()
    
    /**
     Riproduce la traccia sonora relativa al drop.
     - Author: Volpe Alberto
     - Version: 1.0 */
    func playDrop()
}



/** Definizione delle proprietà e dei metodi utili alla riproduzione dell'effetto sonoro di tipo associativo.
    - Important: Questo protocollo eredità tutte le sue funzionalità dal protocollo Playable senza aggiungere altro. È stato definito al fine di differenziare le tipologie di suono e riprodurre l'effetto con un livello sonoro corretto.
    - Author: Volpe Alberto
    - Version: 1.0 */
protocol AssociativeSound: Playable {}


/** Definizione delle proprietà e dei metodi utili alla riproduzione della traccia sonora relativa alla storia.
    - Author: Volpe Alberto
    - Version: 1.0 */
protocol StorySound: Playable {}










