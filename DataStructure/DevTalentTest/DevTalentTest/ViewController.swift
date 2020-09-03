//
//  ViewController.swift
//  DevTalentTest
//
//  Created by smitesh patel on 2020-08-31.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel = WeatherViewModel()
    
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.didFetchWeatherData = { [weak self] info in
            self?.handleWeatherInfo(info)
        }
        viewModel.fetchWeatherData()
    }
    
    private func handleWeatherInfo(_ info: WeatherDetails) {
        testLabel.text = "\(info.name ?? "") \(info.main?.temp ?? 0.0)"
    }
}

