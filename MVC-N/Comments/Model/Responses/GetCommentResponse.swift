//
//  GetCommentResponse.swift
//  MVC-N
//
//  Created by Mac on 05.10.2021.
//

import Foundation

struct GetCommentResponse {
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else { throw NetworkError.failInternetError }
        
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}
