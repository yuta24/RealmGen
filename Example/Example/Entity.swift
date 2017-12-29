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

