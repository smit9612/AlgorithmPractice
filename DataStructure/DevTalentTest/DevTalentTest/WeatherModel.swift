//
//  WeatherModel.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation
// MARK: - WeatherDetails
struct WeatherDetails: PlatformNetworkCodable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone, id: Int?
    var name: String?
    var cod: Int?
}

// MARK: - Clouds
struct Clouds: PlatformNetworkCodable {
    var all: Int?
}

// MARK: - Coord
struct Coord: PlatformNetworkCodable {
    var lon, lat: Double?
}

// MARK: - Main
struct Main: PlatformNetworkCodable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: PlatformNetworkCodable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: PlatformNetworkCodable {
    var id: Int?
    var main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}

// MARK: - Wind
struct Wind: PlatformNetworkCodable {
    var speed: Double?
    var deg: Int?
}
