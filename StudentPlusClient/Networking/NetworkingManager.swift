//
//  NetworkingManager.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = URL(string: "http://localhost:5000/api")!
    
    private init() {}
    
    func request<T: Codable>(route: Route, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents(url: baseURL.appendingPathComponent(route.path), resolvingAgainstBaseURL: false)!
        
        if !route.parameters.isEmpty {
            components.queryItems = route.parameters.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        
        let url = components.url!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = route.method.rawValue
        urlRequest.allHTTPHeaderFields = route.headers
        
        do {
            if !route.body.isEmpty {
                let jsonData = try JSONEncoder().encode(route.body)
                urlRequest.httpBody = jsonData
            }
        } catch {
            print("Error encoding parameters as JSON: \(error)")
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data returned from server"])))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    func requestArray<T: Codable>(route: Route, completion: @escaping (Result<[T], Error>) -> Void) {
        request(route: route) { (result: Result<Array<T>, Error>) in
            switch result {
            case .success(let array):
                completion(.success(array))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
