//
//  DataManager.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

import Foundation

struct DataManager {
    
    var dataHandler: DataHandler? = nil
    
    private let decoder = JSONDecoder()
    
    func parseJsonToWeatherData(data: Data) -> WeatherData? {
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            dataHandler?.onParseDataFailed(error: error)
            return nil
        }
    }
}
