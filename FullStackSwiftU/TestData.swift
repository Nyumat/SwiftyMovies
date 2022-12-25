//
//  TestData.swift
//  FullStackSwiftU
//
//  Created by Thomas Nyuma on 12/25/22.
//

import Foundation
import UIKit

struct TestData {
    static var movies: [Movie] = {
        let url = Bundle.main.url(forResource: "Movies", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let movies = try! decoder.decode([Movie].self, from: data)
        return movies
    }()
}
