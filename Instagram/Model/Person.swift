//
//  Person.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation

struct Person: Identifiable, Codable {
    var id: UUID
    var fullname: String
    var email: String
    var username: String
    var profileImage: String
    var age: Int
    var bio: String
    var followers: Int
    var followings: Int
    var posts: String
    var reels: String
    
    init(id: UUID, fullName: String, email: String, username: String, profileImage: String, age: Int = 18, bio: String = "hai", followers: Int, followings: Int, posts: String = "", reels: String = "") {
        self.id = id
        self.fullname = fullName
        self.email = email
        self.username = username
        self.profileImage = profileImage
        self.age = age
        self.bio = bio
        self.followers = followers
        self.followings = followings
        self.posts = posts
        self.reels = reels
    }
}

extension Person {
    enum CodingKeys: String, CodingKey {
        case id
        case fullname
        case email
        case username
        case profileImage = "profile_image"
        case age
        case bio
        case followers
        case followings
        case posts
        case reels
    }
    
    var postsCount: Int {
        return 0
    }
    
    static var MOCK_DATA: [Person] {
        return [
            .init(id: UUID(), fullName: "Aditya", email: "aditya@gmail.com", username: "aditya_bhardwaj", profileImage: "", followers: 2, followings: 10),
            .init(id: UUID(), fullName: "Akshay", email: "akshay@gmail.com", username: "akshay_bhardwaj", profileImage: "", followers: 0, followings: 0),
            .init(id: UUID(), fullName: "Shubham", email: "shubham@gmail.com", username: "shubham_bhardwaj", profileImage: "", followers: 0, followings: 0),
            .init(id: UUID(), fullName: "Rohit", email: "rohit@gmail.com", username: "rohit_bhardwaj", profileImage: "", followers: 0, followings: 0),
            .init(id: UUID(), fullName: "Vishal", email: "vishal@gmail.com", username: "vishal_bhardwaj", profileImage: "", followers: 0, followings: 0),
            .init(id: UUID(), fullName: "Amit", email: "amit@gmail.com", username: "amit_bhardwaj", profileImage: "", followers: 0, followings: 0),
        ]
    }
}
