//
//  XMLSettings.swift
//  TMS Test
//
//  Created by Alberto Volpe on 05/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation

enum XMLSchemeTags {
    
    //Elenca tutte le versioni
    case version_01
    
    static func get(ofVersion version: String) throws -> XMLSchemeTags {
        
        switch version {
        case "0.1":
            return .version_01
        default:
            throw XMLSchemeTagsError.invalidVersion
        }
    }
    
    
    /* Elenco di nodi ammessi
     Matching tra la var e il tag name
     Usa case .version_XX:
     falltrough
     nel caso in cui non sia stato ridefinito il tag/attributo
     */
    
    func description() throws -> String {
        switch self {
        case .version_01:
            return "tms:Description"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func cover() throws -> String {
        switch self {
        case .version_01:
            return "tms:cover"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func languages() throws -> String {
        switch self {
        case .version_01:
            return "tms:Languages"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func basicElement() throws -> String {
        switch self {
        case .version_01:
            return "tms:BasicElement"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func interactionableElement() throws -> String {
        switch self {
        case .version_01:
            return "tms:InteractionableElement"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func draggableElement() throws -> String {
        switch self {
        case .version_01:
            return "tms:DraggableElement"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func element() throws -> String {
        switch self {
        case .version_01:
            return "tms:Element"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func background() throws -> String {
        switch self {
        case .version_01:
            return "tms:background"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func col() throws -> String {
        switch self {
        case .version_01:
            return "tms:col"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func row() throws -> String {
        switch self {
        case .version_01:
            return "tms:row"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func objects() throws -> String {
        switch self {
        case .version_01:
            return "tms:Objects"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func positionable() throws -> String {
        switch self {
        case .version_01:
            return "tms:Positionable"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func associativeSound() throws -> String {
        switch self {
        case .version_01:
            return "tms:AssociativeSound"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func destination() throws -> String {
        switch self {
        case .version_01:
            return "tms:Destination"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func hintOnSuccess() throws -> String {
        switch self {
        case .version_01:
            return "tms:HintOnSuccess"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func hintOnFailure() throws -> String {
        switch self {
        case .version_01:
            return "tms:HintOnFailure"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }

    
    func language() throws -> String {
        switch self {
        case .version_01:
            return "tms:language"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func language2() throws -> String {
        switch self {
        case .version_01:
            return "tms:Language"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func value() throws -> String {
        switch self {
        case .version_01:
            return "tms:value"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func title() throws -> String {
        switch self {
        case .version_01:
            return "tms:Title"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func text() throws -> String {
        switch self {
        case .version_01:
            return "tms:Text"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func authorID() throws -> String {
        switch self {
        case .version_01:
            return "tms:authorID"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func storyID() throws -> String {
        switch self {
        case .version_01:
            return "tms:storyID"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func sound() throws -> String {
        switch self {
        case .version_01:
            return "tms:sound"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func scenes() throws -> String {
        switch self {
        case .version_01:
            return "tms:Scenes"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func scene() throws -> String {
        switch self {
        case .version_01:
            return "tms:Scene"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func nextSceneID() throws -> String {
        switch self {
        case .version_01:
            return "tms:nextSceneID"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func hint() throws -> String {
        switch self {
        case .version_01:
            return "tms:Hint"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func sceneID() throws -> String {
        switch self {
        case .version_01:
            return "tms:sceneID"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    func visual() throws -> String {
        switch self {
        case .version_01:
            return "tms:visual"
        default:
            throw XMLSchemeTagsError.tagNotPresent
        }
    }
    
    
}

