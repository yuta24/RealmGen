# RealmGen

RealmGen is code generation tool for realm object.

## Usage

`realmgen /source/path`

## Example

Source code. Type must inherit `RealmConvertible`. You must define `RealmConvertible`. It's not include this library yet.

```swift
public struct User: RealmConvertible {
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
```

Generated code.

```swift
import Realm
import RealmSwift

public class UserRealm: Object {
    
    @objc dynamic var login: String = ""
    
    @objc dynamic var id: Int64 = 0
    
    @objc dynamic var avatarUrlRaw: String = ""
    
    @objc dynamic var gravatarId: String = ""
    
    @objc dynamic var urlRaw: String = ""
    
    @objc dynamic var htmlUrlRaw: String = ""
    
    @objc dynamic var followersUrlRaw: String = ""
    
    @objc dynamic var followingUrlRaw: String = ""
    
    @objc dynamic var gistsUrlRaw: String?
    
    @objc dynamic var starredUrlRaw: String = ""
    
    @objc dynamic var subscriptionsUrlRaw: String = ""
    
    @objc dynamic var organizationsUrlRaw: String = ""
    
    @objc dynamic var reposUrlRaw: String = ""
    
    @objc dynamic var eventsUrlRaw: String = ""
    
    @objc dynamic var receivedEventsUrlRaw: String = ""
    
    @objc dynamic var type: String = ""
    
    @objc dynamic var siteAdmin: Bool = false
    
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
        
        self.login = entity.login
        
        self.id = entity.id
        
        self.avatarUrlRaw = entity.avatarUrlRaw
        
        self.gravatarId = entity.gravatarId
        
        self.urlRaw = entity.urlRaw
        
        self.htmlUrlRaw = entity.htmlUrlRaw
        
        self.followersUrlRaw = entity.followersUrlRaw
        
        self.followingUrlRaw = entity.followingUrlRaw
        
        self.gistsUrlRaw = entity.gistsUrlRaw
        
        self.starredUrlRaw = entity.starredUrlRaw
        
        self.subscriptionsUrlRaw = entity.subscriptionsUrlRaw
        
        self.organizationsUrlRaw = entity.organizationsUrlRaw
        
        self.reposUrlRaw = entity.reposUrlRaw
        
        self.eventsUrlRaw = entity.eventsUrlRaw
        
        self.receivedEventsUrlRaw = entity.receivedEventsUrlRaw
        
        self.type = entity.type
        
        self.siteAdmin = entity.siteAdmin
        
    }
}

```

## TODO

- [ ] Support nested type
- [ ] Support extension
- [ ] Support enum and custom type

## LICENSE

RealmGen is released under the MIT license. Go read the LICENSE file for more information.
