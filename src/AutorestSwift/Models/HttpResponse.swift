//
//  File.swift
//  
//
//  Created by Sam Cheung on 2020-07-15.
//

import Foundation

public typealias HttpResponse = Compose<HttpResponseProperty, Protocol>

public struct HttpResponseProperty: Codable {

    
    public let statusCodes: String
fdfd s

    public let knownMediaType: knownMediaType
    
    public let mediaTypes: mediaTypes
    
        public let headers: [HttpHeader]
    
    public let headerGroups: [GroupSchema]

}
