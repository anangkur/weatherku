//
//  NetworkManager.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

import Foundation

struct NetworkManager {
    
    var networkHandler: NetworkHandler? = nil
    
    private let dataManager = DataManager()
    
    func createNetworkingSession(url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleData(data:urlResponse:error:))
            task.resume()
        }
    }
    
    private func handleData(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            networkHandler?.onFetchDataFailed(error: error!)
            return
        }
        if let safeData = data {
            networkHandler?.onFetchDataSuccess(data: safeData)
        }
    }
}
