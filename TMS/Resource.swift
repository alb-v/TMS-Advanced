//
//  Resource.swift
//  TMS
//
//  Created by Alberto Volpe on 18/09/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

public enum Location {
    case project
    case remote
    case framework
}

public struct Resource {
    var location: Location
    var nameOrURL: String
}
