//
//  WeatherViewModel.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation

struct WeatherViewModel: ServiceInjected {
    
    var didFetchWeatherData: ((WeatherDetails) -> ())?
    
    func fetchWeatherData() {
        
        weatherService.fetchWeatherData() { weatherData in
            self.didFetchWeatherData?(weatherData)
        }
        
        
    }
}
