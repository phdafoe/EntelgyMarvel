//
//  ServiceManager.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

protocol ServiceManagerProtocol {
    func fetchListCharacters(from endpoint: ListEndPoint,completion: @escaping (Result<ListCharacteresModel, ApiError>) -> ())
    func fetchDetailCharacter(from endpoint: ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailComicModel, ApiError>) -> ())
    func fetchDetailSeries(from endpoint:ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailSeriesModel, ApiError>) -> ())
    func fetchListComics(from endpoint: ListEndPoint, completion: @escaping (Result<ListComicsModel, ApiError>) -> ())
}

enum ListEndPoint: String {
    case characters
    case comics
    case series
    case stories
    
    var description: String {
        switch self {
        case .characters: return "Characters"
        case .comics: return "Comics"
        case .series: return "Series"
        case .stories: return "Stories"
        }
    }
}

enum ApiError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fecth data"
        case .invalidEndpoint: return "Invalid enpoint"
        case .invalidResponse: return "Invalild response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
