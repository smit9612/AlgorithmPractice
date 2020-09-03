//
//  WeatherService.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation

final class WeatherService: WeatherServiceProtocol {
    
    func fetchWeatherData(completion complete: @escaping (WeatherDetails) -> ()) {
        let apiService = APIService()
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Toronto&units=imperial&appid=d7a12a132bf363c1c0ae7b8df6f2d42c") else { return }
        
        let request = URLRequest(url: url)
        apiService.performRequest(request: request) { responseData in
            if let weatherDetails: WeatherDetails = WeatherDetails.from(data: responseData!) {
                DispatchQueue.main.async {
                    complete(weatherDetails)
                }
            }
        }
    }
}




