//
//  Request.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 26/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//
import Foundation
// MARK: Class

/** Class responsible to handling networks request*/

class Request<T: EndPointType>: NetworkProtocol {
    // MARK: Varibles
      private var task: URLSessionTask?

    // MARK: Functions
    /** Perform contains implemention body of request, but it must to have Api keys and required IDs*/

    func perform<U: Decodable>(_ endPoint: T, queryItem: [String: Any]? = nil, completion: @escaping (U?, Errors?) -> (Void)) {

        let session = URLSession.shared
        var component = URLComponents(url: endPoint.url, resolvingAgainstBaseURL: false)
        if let queryItem = queryItem {
            component?.queryItems = []
            for (key, value) in queryItem {
                let item = URLQueryItem(name: key, value: "\(value)")
                component?.queryItems?.append(item)
            }
        }
        guard let url = component?.url else { return }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = "GET"
        self.task = session.dataTask(with: request, completionHandler: { (data, _, error) in
                guard let responseData = data, error == nil else {
                    if let unwrappedError = error {
                         print("Request Error:", unwrappedError.localizedDescription)
                    }
                    return DispatchQueue.main.async {completion(nil, Errors.failRequest)}
                }
                do {
                    let decodeObject = try JSONDecoder().decode(U.self, from: responseData)
                    DispatchQueue.main.async {
                        completion(decodeObject, nil)
                    }
                } catch {
                    print("Decoding error:", error)
                    DispatchQueue.main.async {completion(nil, Errors.failRequest)}
                }
            })
        self.task?.resume()
        }

    /**Call this function when you want to cancel your task call*/
    func cancel() {
        self.task?.cancel()
    }

}
