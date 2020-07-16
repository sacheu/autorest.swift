//
//  Response.swift
//
//
//  Created by Travis Prescott on 7/14/20.
//

import Foundation

public typealias SchemaResponse = Compose<SchemaResponseProperty, Response>

public struct SchemaResponseProperty: Codable {
    // the content returned by the service for a given operaiton
    public let schema: Schema

    // indicates whether the response can be 'null'
    public let nullable: Bool?
}
