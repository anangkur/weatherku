//
//  WeatherData.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

struct WeatherData : Decodable {
    let id: Int
    let name: String
    let main: Main
    let weather: [Weather]
    
    func toWeatherModel() -> WeatherModel {
        return WeatherModel(conditionalId: weather.first!.id, cityName: name, temperature: main.temp)
    }
}

struct Main : Decodable {
    let temp: Double
}

struct Weather : Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
