//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 2.08.22.
//

import Foundation

struct CurrentWeather: Codable {
    let coord: Coordinates
    let weather: [WeatherDescription]
    let main: TempInfo
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct TempInfo: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
}
