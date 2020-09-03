//
//  ServiceInjector.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation

protocol ServiceInjected {}

extension ServiceInjected {
    
    var weatherService: WeatherServiceProtocol {
        return ServiceInjector.weatherService
    }
}

struct ServiceInjector {
    static var weatherService: WeatherServiceProtocol = WeatherService()
}
