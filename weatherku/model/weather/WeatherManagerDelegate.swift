//
//  WeatherHandler.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

protocol WeatherManagerDelegate {
    func onFetchWeatherSuccess(weatherModel: WeatherModel)
    func onFetchWeatherFailed(error: Error)
}
