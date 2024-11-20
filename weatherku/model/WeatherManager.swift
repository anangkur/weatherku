//
//  WeatherManager.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

import Foundation

struct WeatherManager : NetworkHandler, DataHandler {
    
    private let weatherHandler: WeatherHandler
    
    private var networkManager = NetworkManager()
    private var dataManager = DataManager()
    
    init(weatherHandler: WeatherHandler) {
        self.weatherHandler = weatherHandler
        networkManager.networkHandler = self
        dataManager.dataHandler = self
    }
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?appid=baee036e701887e7784ef61d55aa8178&units=metric"
    
    func fetchWeather(city: String) {
        networkManager.createNetworkingSession(url: "\(url)&q=\(city)")
    }
    
    func onFetchDataSuccess(data: Data) {
        if let safeWeatherData = dataManager.parseJsonToWeatherData(data: data) {
            weatherHandler.onFetchWeatherSuccess(weatherModel: safeWeatherData.toWeatherModel())
        }
    }
    
    func onFetchDataFailed(error: any Error) {
        weatherHandler.onFetchWeatherFailed(error: error)
    }
    
    func onParseDataFailed(error: any Error) {
        weatherHandler.onFetchWeatherFailed(error: error)
    }
}
