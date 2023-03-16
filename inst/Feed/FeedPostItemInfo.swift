//
//  FeedPostItemInfo.swift
//  inst
//
//  Created by  ratmir on 14.03.2023.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let userName: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
