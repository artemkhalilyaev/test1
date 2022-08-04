//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 4.08.22.
//

import Foundation

class NetworkManager {
    private let apiKey = "4f594b6caca6beb3a15d373071f8751a"

    func fetchWeather(city: String, completion: @escaping (CurrentWeather?, Error?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let weatherData = try JSONDecoder().decode(CurrentWeather.self, from: data)
                    completion(weatherData, nil)
                } catch let decodeError {
                    completion(nil, decodeError)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    

}
