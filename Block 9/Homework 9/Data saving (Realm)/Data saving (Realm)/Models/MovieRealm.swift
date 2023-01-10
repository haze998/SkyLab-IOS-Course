//
//  MovieRealm.swift
//  Data saving (Realm)
//
//  Created by Evgeniy Docenko on 05.01.2023.
//

import Foundation
import RealmSwift

class MovieRealm: Object {
    
    @Persisted var adult: Bool
    @Persisted var backdropPath: String
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var originalLanguage: String
    @Persisted var originalTitle: String
    @Persisted var mediaType: String
    @Persisted var popularity: Double
    @Persisted var releaseDate: String
    @Persisted var video: Bool
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
}
