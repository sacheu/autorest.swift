// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable cyclomatic_complexity

public struct PetHungryOrThirstyError: Codable, Swift.Error {
    /// is the pet hungry or thirsty or both
    public let hungryOrThirsty: String?

    /// Initialize a `PetHungryOrThirstyError` structure.
    /// - Parameters:
    ///   - hungryOrThirsty: is the pet hungry or thirsty or both
    public init(
        hungryOrThirsty: String? = nil
    ) {
        self.hungryOrThirsty = hungryOrThirsty
    }

    enum CodingKeys: String, CodingKey {
        case hungryOrThirsty
    }

    /// Initialize a `PetHungryOrThirstyError` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hungryOrThirsty = try? container.decode(String.self, forKey: .hungryOrThirsty)
    }

    /// Encode a `PetHungryOrThirstyError` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hungryOrThirsty != nil { try? container.encode(hungryOrThirsty, forKey: .hungryOrThirsty) }
    }
}
