//
//  APIManager.swift
//  APIManager
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import Foundation

final public class APIManager {
    
    // MARK: - Private Properties
    private let config: URLSessionConfiguration
    
    // MARK: - Public Init
    public init(config: URLSessionConfiguration = .default) {
        self.config = config
    }
    
    // MARK: - Public Method
    public func request<T: Decodable>(to url: URL, body: Data? = nil, method: HttpMethod = .get, headers: HttpHeaders? = nil, completion: @escaping (Result<T?, HttpError>) -> Void) {
        let session: URLSession = URLSession(configuration: config)
        var request: URLRequest = URLRequest(url: url)
        request.httpBody = body
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        printRequestLog(request: request)
        session.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil else {
                completion(.failure(.genericError))
                return
            }
            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else {
                completion(.failure(.genericError))
                return
            }
            guard let data: Data = data else {
                completion(.failure(.notData))
                return
            }
            self?.printResponseLog(httpResponse: httpResponse, data: data)
            switch httpResponse.statusCode {
            case 204:
                completion(.success(nil))
            case 200...299:
                do {
                    let object: T = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(.decodingError))
                }
            case 400:
                completion(.failure(.badRequest))
            case 401:
                completion(.failure(.unauthorized))
            case 403:
                completion(.failure(.forbidden))
            case 404:
                completion(.failure(.notFound))
            case 406:
                completion(.failure(.notAcceptableStatus))
            case 500:
                completion(.failure(.serverError))
            case 503:
                completion(.failure(.serviceUnavailable))
            default:
                completion(.failure(.genericError))
            }
            
        }.resume()
    }
    
    private func printRequestLog(request: URLRequest) {
        print("✅ ======= Request ======= ✅")
        debugPrint("URL: \(request.url?.absoluteString ?? "")")
        debugPrint("METHOD: \(request.httpMethod ?? "")")
        debugPrint("BODY: \(String(decoding: request.httpBody ?? Data("No content.".utf8), as: UTF8.self))")
        debugPrint("HEADERS: \(request.allHTTPHeaderFields ?? ["": ""])")
        print("✅ ======= Request ======= ✅")
    }
    
    private func printResponseLog(httpResponse: HTTPURLResponse, data: Data) {
        print("✅ ======= Response ======= ✅")
        debugPrint("STATUS CODE: \(httpResponse.statusCode)")
        debugPrint("BODY: \(String(decoding: httpResponse.statusCode == 204 ? Data("No content.".utf8) : data, as: UTF8.self))")
        print("✅ ======= Response ======= ✅")
    }
}
