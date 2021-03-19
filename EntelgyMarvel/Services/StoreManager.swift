//
//  StoreManager.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

class StoreManager: ServiceManagerProtocol {
    
    static let shared = StoreManager()
    private init() {}
    
    func fetchListCharacters(from endpoint: ListEndPoint, completion: @escaping (Result<ListCharacteresModel, ApiError>) -> ()) {
        guard let url = URL(string: "\(Utils.BaseURL().baseAPIURL)/\(endpoint)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params:[
            "orderBy": "name",
            "limit": "20",
            "hash": "\(Helpers().getHash())",
            "ts": "\(Helpers().getTimeStamp())"
        ], completion: completion)
    }
    
    func fetchDetailCharacter(from endpoint: ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailComicModel, ApiError>) -> ()) {
        guard let url = URL(string: "\(Utils.BaseURL().baseAPIURL)/\(endpoint)/\(id)/\(typeEndpoint)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params:[
            "orderBy": "title",
            "characterId": "\(id)",
            "limit": "20",
            "hash": "\(Helpers().getHash())",
            "ts": "\(Helpers().getTimeStamp())"
        ], completion: completion)
    }
    
    func fetchDetailSeries(from endpoint:ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailSeriesModel, ApiError>) -> ()) {
        guard let url = URL(string: "\(Utils.BaseURL().baseAPIURL)/\(endpoint)/\(id)/\(typeEndpoint)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params:[
            "orderBy": "title",
            "characterId": "\(id)",
            "limit": "20",
            "hash": "\(Helpers().getHash())",
            "ts": "\(Helpers().getTimeStamp())"
        ], completion: completion)
    }
    
    func fetchListComics(from endpoint: ListEndPoint, completion: @escaping (Result<ListComicsModel, ApiError>) -> ()) {
        guard let url = URL(string: "\(Utils.BaseURL().baseAPIURL)/\(endpoint)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params:[
            "orderBy": "title",
            "limit": "20",
            "hash": "\(Helpers().getHash())",
            "ts": "\(Helpers().getTimeStamp())"
        ], completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params:[String: String]? = nil, completion: @escaping (Result<D, ApiError>) -> ()) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItemsArray = [URLQueryItem(name: "apikey", value: Utils.BaseURL().publicApiKey)]
        if let paramsDes = params {
            queryItemsArray.append(contentsOf: paramsDes.map { URLQueryItem(name: $0.key, value: $0.value)})
        }
        urlComponents.queryItems = queryItemsArray
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        Utils.BaseURL().urlSession.dataTask(with: finalURL) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if error != nil{
                self.executeCompletionHandlerInMainThread(whit: .failure(.apiError), completion: completion)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerInMainThread(whit: .failure(.invalidResponse), completion: completion)
                return
            }
            guard let dataDes = data else {
                self.executeCompletionHandlerInMainThread(whit: .failure(.noData), completion: completion)
                return
            }
            do {
                let decodeResponse = try Utils.BaseURL().jsonDecoder.decode(D.self, from: dataDes)
                self.executeCompletionHandlerInMainThread(whit: .success(decodeResponse), completion: completion)
            } catch {
                self.executeCompletionHandlerInMainThread(whit: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(whit result: Result<D, ApiError>, completion: @escaping (Result<D, ApiError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    
}
