//
//  NetworkManager.swift
//  Pexels
//
//  Created by Rajeev on 28/04/22.
//

import Foundation
protocol DataSourceProtocol {
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T,Error>) -> ())
}

class NetworkManager: DataSourceProtocol {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    private lazy var session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        return URLSession(configuration: sessionConfiguration)
    }()
    
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T,Error>) -> ()) {
        guard let downloadUrl = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: downloadUrl)
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                
                let cachedData = CachedURLResponse(response: response!, data: data!)
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: cachedData.data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()

    }
}
