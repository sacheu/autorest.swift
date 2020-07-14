//
//  UriSchema.swift
//  
//
//  Created by Sam Cheung on 2020-07-13.
//

import Foundation

/// a schema that represents a Uri value
public struct UriSchema: CodeModelProperty {
    public let properties: StringSchemaProperties

    public let defaultProperties = [String]()

    public let additionalProperties = false

    public let allOf: [PrimitiveSchema]
}

public struct UriSchemaProperties: CodeModelPropertyBundle {
    /// the maximum length of the string
    public let maxLength: Int?

    /// the minimum length of the string
    public let minLength: Int?

    /// a regular expression that the string must be validated against
    public let pattern: String?
}
