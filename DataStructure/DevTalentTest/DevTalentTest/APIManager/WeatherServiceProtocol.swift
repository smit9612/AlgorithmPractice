//
//  WeatherServiceProtocol.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func fetchWeatherData(completion complete: @escaping (WeatherDetails) -> ())
}
