//
//  APImodel.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import Foundation

func getRnd(){
    let headers = [
        "X-RapidAPI-Key": "b3454ddff0msh0e91f6f050916adp18d8bfjsnce402ac7decc",
        "X-RapidAPI-Host": "cookr-recipe-parser.p.rapidapi.com"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://cookr-recipe-parser.p.rapidapi.com/getRecipe?source=http%3A%2F%2Fwww.culinaryhill.com%2Fspinach-and-artichoke-dip")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error as Any)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })

    dataTask.resume()
}
