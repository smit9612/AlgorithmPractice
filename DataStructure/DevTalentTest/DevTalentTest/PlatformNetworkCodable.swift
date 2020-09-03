//
//  PlatformNetworkCodable.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation
public protocol PlatformNetworkCodable: Codable {
    
    /// Converts data to a PlatformNetworkCodable DataModel object
    ///
    /// - Parameter data: A JSON decodable data
    /// - Returns: An object conforming PlatformNetworkCodable
    static func from<T>(data: Data) -> T? where T: Codable
    
    /// Converts data to an array of PlatformNetworkCodable DataModel object
    ///
    /// - Parameter data: A JSON decodable data
    /// - Returns: An array of an object conforming PlatformNetworkCodable
    static func arrayFrom<T>(data: Data) -> [T]? where T: Codable
}

extension PlatformNetworkCodable {
    
    public static func from<T>(data: Data) -> T? where T: Codable {
        guard let decodedObj = try? JSONDecoder().decode(T.self, from: data) else {
            print("Unable to decode \(T.self).")
            return nil
        }
        
        return decodedObj
    }
    
    public static func arrayFrom<T>(data: Data) -> [T]? where T: Codable {
        guard let decodedObj = try? JSONDecoder().decode([T].self, from: data) else {
            print("Unable to decode array \(T.self).")
            return nil
        }
        
        return decodedObj
    }
}
