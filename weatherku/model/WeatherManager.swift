//
//  WeatherManager.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

class WeatherManager {
    
    private let networkManager = NetworkManager()
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?appid=baee036e701887e7784ef61d55aa8178&units=metric"
    
    func fetchWeather(city: String) {
        networkManager.createNetworkingSession(url: "\(url)&q=\(city)")
    }
}
