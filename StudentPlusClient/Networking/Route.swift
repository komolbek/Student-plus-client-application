//
//  Route.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

protocol Route {
    var path: String { get }
    var method: RouteMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var body: [String: String] { get }
}
