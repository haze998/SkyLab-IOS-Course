//
//  Post.swift
//  Custom design (Instagram page)
//
//  Created by Evgeniy Docenko on 18.12.2022.
//

import Foundation

struct Post {
    var avatarImageName: String
    var userName: String
    var postImageName: String
    var viewsCount: Int
    var description: String
    var countOfComments: Int
    var postedAt: String
    
}

var firstPost = Post(avatarImageName: "cyberpunk", userName: "cyberpunk_2077", postImageName: "city", viewsCount: 123198, description: "The Free City of Night City (NC) is an autonomous city located on the border between North and South California, on the Pacific coast of North America. It is considered a modern multicultural metropolis of the 21st-century, overrun by corporations, corruption, organized crime and gang violence", countOfComments: 325, postedAt: "25 minutes ago")
var secondPost = Post(avatarImageName: "bionic-eye", userName: "judy_alvarez", postImageName: "judy", viewsCount: 2130, description: "Judy Alvarez is a skilled braindance techie and a member of the Mox. She has her own apartment in northeastern Kabuki, Watson. Judy is a possible romance option for V in Cyberpunk 2077", countOfComments: 192, postedAt: "1 day ago")
var thirdPost = Post(avatarImageName: "helmet", userName: "vi_official", postImageName: "vi", viewsCount: 2300, description: "“It has our blood in it. Blood of the Afterlife. Either he subjugates this city, or the city kills him. There is no third. — Bestia Amendiares on Vi", countOfComments: 127, postedAt: "10 minutes ago")
