//
//  File.swift
//  
//
//  Created by Sam Cheung on 2020-07-15.
//

import Foundation

public typealias HttpWithBodyRequest = Compose<HttpWithBodyRequestProperty, HttpRequest>

public struct HttpWithBodyRequestProperty: Codable {
    /// a normalized value for the media type (ie, distills down to a well-known moniker (ie, 'json'))
    public let knownMediaType: KnownMediaType

    /// must contain at least one media type to send for the body
    public let mediaTypes: String
}
