//
//  Metadata.swift
//
//
//  Created by Travis Prescott on 7/10/20.
//

import Foundation

/// Common pattern for Metadata on aspects
public class Metadata: Codable {
    /// per-language information for this aspect
    public let language: Languages

    /// per-protocol information for this aspect
    public let `protocol`: Protocols

    /// additional metadata extensions dictionary
    public let extensions: [String: Bool]?
}
