//
//  Response.swift
//
//
//  Created by Travis Prescott on 7/14/20.
//

import Foundation

public typealias Response = Compose<ResponseProperty, Metadata>

public struct ResponseProperty: Codable {
    public let schema: Schema

}
