//
//  Effects.swift
//  TMS
//
//  Created by Alberto Volpe on 02/08/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

/** Indica gli effetti applicabili agli oggetti presenti nella scena.
    - Important: Questi effetti sono stati definiti nell'Action.sks
    - Author: Volpe Alberto
    - Version: 1.0 */
enum Effects: String {
    /** Effetto di default applicabile ad un oggetto presente nella scena.*/
    case defaultState = "levitate"
    /** Transizione dallo stato di default allo stato di oggetto attivo.*/
    case transitionToOn = "UpScale"
    /** Transizione dallo stato di attivo allo stato di default.*/
    case transitionToOff = "DownScale"
}
