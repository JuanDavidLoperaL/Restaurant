//
//  HttpError.swift
//  APIManager
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import Foundation

public enum HttpError: Int, Error {
    case genericError = 1
    case decodingError = 2
    case notData = 3
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case notAcceptableStatus = 406
    case serverError = 500
    case serviceUnavailable = 503
}
