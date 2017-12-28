# RealmGen

RealmGen is code generation tool for realm object.

## Example

```swift
public struct User: StoreModel, RealmConvertible {
    public let login: String
    public let id: Int64
    public let avatarUrlRaw: String
    public let gravatarId: String
    public let urlRaw: String
    public let htmlUrlRaw: String
    public let followersUrlRaw: String
    public let followingUrlRaw: String
    public let gistsUrlRaw: String
    public let starredUrlRaw: String
    public let subscriptionsUrlRaw: String
    public let organizationsUrlRaw: String
    public let reposUrlRaw: String
    public let eventsUrlRaw: String
    public let receivedEventsUrlRaw: String
    public let type: String
    public let siteAdmin: Bool
}

// Code-generated
public class UserRealm: Object {
    @objc dynamic var login: String
    @objc dynamic var id: Int64
    @objc dynamic var avatarUrlRaw: String
    @objc dynamic var gravatarId: String
    @objc dynamic var urlRaw: String
    @objc dynamic var htmlUrlRaw: String
    @objc dynamic var followersUrlRaw: String
    @objc dynamic var followingUrlRaw: String
    @objc dynamic var gistsUrlRaw: String
    @objc dynamic var starredUrlRaw: String
    @objc dynamic var subscriptionsUrlRaw: String
    @objc dynamic var organizationsUrlRaw: String
    @objc dynamic var reposUrlRaw: String
    @objc dynamic var eventsUrlRaw: String
    @objc dynamic var receivedEventsUrlRaw: String
    @objc dynamic var type: String
    @objc dynamic var siteAdmin: Bool
}

extension UserRealm {
    convenience init(_ model: User) {
        self.init()
        self.login = model.login
        self.id = model.id
        self.avatarUrlRaw = model.avatarUrlRaw
        self.gravatarId = model.gravatarId
        self.urlRaw = model.urlRaw
        self.htmlUrlRaw = model.htmlUrlRaw
        self.followersUrlRaw = model.followersUrlRaw
        self.followingUrlRaw = model.followingUrlRaw
        self.gistsUrlRaw = model.gistsUrlRaw
        self.starredUrlRaw = model.starredUrlRaw
        self.subscriptionsUrlRaw = model.subscriptionsUrlRaw
        self.organizationsUrlRaw = model.organizationsUrlRaw
        self.reposUrlRaw = model.reposUrlRaw
        self.eventsUrlRaw = model.eventsUrlRaw
        self.receivedEventsUrlRaw = model.receivedEventsUrlRaw
        self.type = model.type
        self.siteAdmin = model.siteAdmin
    }
}

extension User {
    public init(_ entity: User) {
        self.init()
        self.login = model.login
        self.id = model.id
        self.avatarUrlRaw = model.avatarUrlRaw
        self.gravatarId = model.gravatarId
        self.urlRaw = model.urlRaw
        self.htmlUrlRaw = model.htmlUrlRaw
        self.followersUrlRaw = model.followersUrlRaw
        self.followingUrlRaw = model.followingUrlRaw
        self.gistsUrlRaw = model.gistsUrlRaw
        self.starredUrlRaw = model.starredUrlRaw
        self.subscriptionsUrlRaw = model.subscriptionsUrlRaw
        self.organizationsUrlRaw = model.organizationsUrlRaw
        self.reposUrlRaw = model.reposUrlRaw
        self.eventsUrlRaw = model.eventsUrlRaw
        self.receivedEventsUrlRaw = model.receivedEventsUrlRaw
        self.type = model.type
        self.siteAdmin = model.siteAdmin
    }
}
```

## TODO

- [ ] Support nested type
- [ ] Support extension
- [ ] Support enum and custom type

# LICENSE

RealmGen is released under the MIT license. Go read the LICENSE file for more information.
