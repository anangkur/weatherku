//
//  WeatherManager.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

import Foundation
import CoreLocation

class WeatherManager : NetworkManagerDelegate, DataManagerDelegate {
    
    var delegate: WeatherManagerDelegate?
    
    private var networkManager = NetworkManager()
    private var dataManager = DataManager()
    
    init() {
        networkManager.delegate = self
        dataManager.delegate = self
    }
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?appid=baee036e701887e7784ef61d55aa8178&units=metric"
    
    func fetchWeather(city: String) {
        networkManager.createNetworkingSession(url: "\(url)&q=\(city)")
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        networkManager.createNetworkingSession(url: "\(url)&lat=\(latitude)&lon=\(longitude)")
    }
    
    func onFetchDataSuccess(data: Data) {
        if let safeWeatherData = dataManager.parseJsonToWeatherData(data: data) {
            delegate?.onFetchWeatherSuccess(weatherModel: safeWeatherData.toWeatherModel())
        }
    }
    
    func onFetchDataFailed(error: any Error) {
        delegate?.onFetchWeatherFailed(error: error)
    }
    
    func onParseDataFailed(error: any Error) {
        delegate?.onFetchWeatherFailed(error: error)
    }
}
