//
//  GroupProperty.swift
//
//
//  Created by Sam Cheung on 2020-07-15.
//

import Foundation

public typealias HttpModel = Compose<HttpModelProperty, Protocol>

public struct HttpModelProperty: Codable {
    public let security: [SecurityRequirement]
}
