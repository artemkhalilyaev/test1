//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 2.08.22.
//

import UIKit

class WeatherViewController: UIViewController {

    var currentWeather: CurrentWeather?

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minMaxLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }

    func setupLabels() {
        guard let currentWeather = currentWeather else {
            return
        }
        cityLabel.text = currentWeather.name
        tempLabel.text = "\(currentWeather.main.temp)"
        descriptionLabel.text = currentWeather.weather[0].description
        minMaxLabel.text = "min \(currentWeather.main.temp_min) max \(currentWeather.main.temp_max)"
        
        humidityLabel.text = "\(currentWeather.main.humidity) %"
        pressureLabel.text = "\(currentWeather.main.pressure) mPa"
        feelsLikeLabel.text = "\(currentWeather.main.feels_like) C"
        visibilityLabel.text = "\(currentWeather.visibility) m"
        
        
    }

}
