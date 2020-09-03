//
//  APIService.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import Foundation



class APIService {

    func performRequest(request: URLRequest, completion complete: @escaping (Data?) -> ()) {
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            complete(data)
            // Need to h
        }
        task.resume()
    }
}
