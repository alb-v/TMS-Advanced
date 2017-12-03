//
//  Languages.swift
//  TMS
//
//  Created by Alberto Volpe on 09/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

public enum Languages: String {
    case English = "EN"
    case Italiano = "IT"
    
    public var description: String {
        switch self {
        case .Italiano:
            return "Italiano"
        default:
            return "English"
        }
    }
    
    public var identification: String {
        switch self {
        case .Italiano:
            return Languages.Italiano.rawValue
        default:
            return Languages.English.rawValue
        }
    }
    
    public func set(id: String) -> Languages {
        switch id {
        case "IT":
            return Languages.Italiano
        default:
            return Languages.English
        }
    }
}
