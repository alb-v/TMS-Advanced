//
//  XMLSchemeTagsError.swift
//  TMS Test
//
//  Created by Alberto Volpe on 05/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation

public enum XMLSchemeTagsError: Error {
    case invalidVersion
    case tagNotPresent
    
    public var errorMsg: String {
        switch self {
        case .invalidVersion:
            return "XMLSchemeTags Enumerator Error -> \nVersione della storia non riconosciuta.\n"
        case .tagNotPresent:
            return "XMLSchemeTags Enumerator Error -> \nNon conosco il nome del tag/attributo relativo a questa versione.\n"
        }
    }
}
