//
//  Movie.swift
//  WeekOneAssignment
//
//  Created by Samba on 3/4/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var posterUrl: URL?
    var release: String
    var overview: String
    var backDropURL: URL?
    
    init(dictionary: [String: Any]) {
        let beg = "https://image.tmdb.org/t/p/w500"
        title = dictionary["title"] as? String ?? "No title"
        release = dictionary["release_date"] as? String ?? "No Release"
        overview = dictionary["overview"] as? String ?? "No overview"
        let backdropPath = dictionary["backdrop_path"] as! String
        let posterPathString = dictionary["poster_path"] as! String
        
        posterUrl = URL(string: beg + posterPathString)
        backDropURL = URL(string: beg + backdropPath)
        // Set the rest of the properties
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}

