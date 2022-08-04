//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Artem Khalilyaev on 4.08.22.
//

import Foundation

struct HourlyDailyWeather: Codable {
    let timezone_offset: Int
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Double
    let weather: [WeatherDescription]
}

struct DailyWeather: Codable {
    let dt: Int
    let temp: DailyTemp
    let weather: [WeatherDescription]
}

struct DailyTemp: Codable {
    let min: Double
    let max: Double
}
