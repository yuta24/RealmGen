//
//  User.swift
//  Example
//
//  Created by yuta24 on 2017/12/29.
//  Copyright © 2017 yuta24. All rights reserved.
//

import Foundation

public struct User: RealmConvertible {
    public let login: String
    public let id: Int64
    public let avatarUrlRaw: String
    public let gravatarId: String
    public let urlRaw: String
    public let htmlUrlRaw: String
    public let followersUrlRaw: String
    public let followingUrlRaw: String
    public let gistsUrlRaw: String?
    public let starredUrlRaw: String
    public let subscriptionsUrlRaw: String
    public let organizationsUrlRaw: String
    public let reposUrlRaw: String
    public let eventsUrlRaw: String
    public let receivedEventsUrlRaw: String
    public let type: String
    public let siteAdmin: Bool
}
