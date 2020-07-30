//
//  PublishedCodable.swift
//  Cupcake Corner
//
//  Created by hawkeyeshi on 7/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

/*
 * Codable is usually really good at recognizing that our property types our Codable when they are,
 * but using the @Published property wrapper makes it harder, so we have do some more work to make the
 * struct conform to Codable
 *
 * For Decodable:
 *    Custom initializer that tries to decode our properties
 * For Encodable:
 *    Custom encode function that tries to encode our properties
 */

private enum CodingKeysIntro: CodingKey, CaseIterable {
    case name
}

class User: ObservableObject, Codable {
    @Published var name = "Sam Shi"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysIntro.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeysIntro.self)
        try container.encode(name, forKey: .name)
    }
}
