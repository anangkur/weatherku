//
//  NetworkHandler.swift
//  weatherku
//
//  Created by Anang Kurniawan on 20/11/24.
//

import Foundation

protocol NetworkHandler {
    func onFetchDataSuccess(data: Data)
    func onFetchDataFailed(error: Error)
}
