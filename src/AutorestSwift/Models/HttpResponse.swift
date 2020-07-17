//
//  File.swift
//
//
//  Created by Sam Cheung on 2020-07-15.
//

import Foundation

public enum HttpResponseStatusCode: String, Codable {
    case _100 = "100"
    // TODO: add the rest of the status code
}

public struct HttpResponse: CodeModelProtocol {
    // the possible HTTP status codes that this response MUST match one of.
    public let statusCodes: [HttpResponseStatusCode]

    // canonical response type (ie, 'json')
    public let knownMediaType: KnownMediaType

    // content returned by the service in the HTTP headers
    public let mediaTypes: [String]

    // content returned by the service in the HTTP headers
    public let headers: [HttpHeader]?

    // sets of HTTP headers grouped together into a single schema
    public let headerGroups: [GroupSchema]?
}
