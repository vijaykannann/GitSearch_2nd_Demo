//
//  userModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 6, 2020

import Foundation
import SwiftyJSON


class userModel : NSObject, NSCoding{

    var avatarUrl : String!
    var bio : String!
    var blog : String!
    var company : String!
    var createdAt : String!
    var email : String!
    var eventsUrl : String!
    var followers : Int!
    var followersUrl : String!
    var following : Int!
    var followingUrl : String!
    var gistsUrl : String!
    var gravatarId : String!
    var hireable : AnyObject!
    var htmlUrl : String!
    var id : Int!
    var location : String!
    var login : String!
    var name : String!
    var nodeId : String!
    var organizationsUrl : String!
    var publicGists : Int!
    var publicRepos : Int!
    var receivedEventsUrl : String!
    var reposUrl : String!
    var siteAdmin : Bool!
    var starredUrl : String!
    var subscriptionsUrl : String!
    var type : String!
    var updatedAt : String!
    var url : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    public required init(json: JSON) {
        avatarUrl = json["avatar_url"].stringValue
        bio = json["bio"].stringValue
        blog = json["blog"].stringValue
        company = json["company"].stringValue
        createdAt = json["created_at"].stringValue
        email = json["email"].stringValue
        eventsUrl = json["events_url"].stringValue
        followers = json["followers"].intValue
        followersUrl = json["followers_url"].stringValue
        following = json["following"].intValue
        followingUrl = json["following_url"].stringValue
        gistsUrl = json["gists_url"].stringValue
        gravatarId = json["gravatar_id"].stringValue
        hireable = json["hireable"] as AnyObject
        htmlUrl = json["html_url"].stringValue
        id = json["id"].intValue
        location = json["location"].stringValue
        login = json["login"].stringValue
        name = json["name"].stringValue
        nodeId = json["node_id"].stringValue
        organizationsUrl = json["organizations_url"].stringValue
        publicGists = json["public_gists"].intValue
        publicRepos = json["public_repos"].intValue
        receivedEventsUrl = json["received_events_url"].stringValue
        reposUrl = json["repos_url"].stringValue
        siteAdmin = json["site_admin"].boolValue
        starredUrl = json["starred_url"].stringValue
        subscriptionsUrl = json["subscriptions_url"].stringValue
        type = json["type"].stringValue
        updatedAt = json["updated_at"].stringValue
        url = json["url"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if avatarUrl != nil{
        	dictionary["avatar_url"] = avatarUrl
        }
        if bio != nil{
        	dictionary["bio"] = bio
        }
        if blog != nil{
        	dictionary["blog"] = blog
        }
        if company != nil{
        	dictionary["company"] = company
        }
        if createdAt != nil{
        	dictionary["created_at"] = createdAt
        }
        if email != nil{
        	dictionary["email"] = email
        }
        if eventsUrl != nil{
        	dictionary["events_url"] = eventsUrl
        }
        if followers != nil{
        	dictionary["followers"] = followers
        }
        if followersUrl != nil{
        	dictionary["followers_url"] = followersUrl
        }
        if following != nil{
        	dictionary["following"] = following
        }
        if followingUrl != nil{
        	dictionary["following_url"] = followingUrl
        }
        if gistsUrl != nil{
        	dictionary["gists_url"] = gistsUrl
        }
        if gravatarId != nil{
        	dictionary["gravatar_id"] = gravatarId
        }
        if hireable != nil{
        	dictionary["hireable"] = hireable
        }
        if htmlUrl != nil{
        	dictionary["html_url"] = htmlUrl
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if location != nil{
        	dictionary["location"] = location
        }
        if login != nil{
        	dictionary["login"] = login
        }
        if name != nil{
        	dictionary["name"] = name
        }
        if nodeId != nil{
        	dictionary["node_id"] = nodeId
        }
        if organizationsUrl != nil{
        	dictionary["organizations_url"] = organizationsUrl
        }
        if publicGists != nil{
        	dictionary["public_gists"] = publicGists
        }
        if publicRepos != nil{
        	dictionary["public_repos"] = publicRepos
        }
        if receivedEventsUrl != nil{
        	dictionary["received_events_url"] = receivedEventsUrl
        }
        if reposUrl != nil{
        	dictionary["repos_url"] = reposUrl
        }
        if siteAdmin != nil{
        	dictionary["site_admin"] = siteAdmin
        }
        if starredUrl != nil{
        	dictionary["starred_url"] = starredUrl
        }
        if subscriptionsUrl != nil{
        	dictionary["subscriptions_url"] = subscriptionsUrl
        }
        if type != nil{
        	dictionary["type"] = type
        }
        if updatedAt != nil{
        	dictionary["updated_at"] = updatedAt
        }
        if url != nil{
        	dictionary["url"] = url
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		avatarUrl = aDecoder.decodeObject(forKey: "avatar_url") as? String
		bio = aDecoder.decodeObject(forKey: "bio") as? String
		blog = aDecoder.decodeObject(forKey: "blog") as? String
		company = aDecoder.decodeObject(forKey: "company") as? String
		createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
		email = aDecoder.decodeObject(forKey: "email") as? String
		eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
		followers = aDecoder.decodeObject(forKey: "followers") as? Int
		followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
		following = aDecoder.decodeObject(forKey: "following") as? Int
		followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
		gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
		gravatarId = aDecoder.decodeObject(forKey: "gravatar_id") as? String
		hireable = aDecoder.decodeObject(forKey: "hireable") as? AnyObject
		htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		location = aDecoder.decodeObject(forKey: "location") as? String
		login = aDecoder.decodeObject(forKey: "login") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
		nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
		organizationsUrl = aDecoder.decodeObject(forKey: "organizations_url") as? String
		publicGists = aDecoder.decodeObject(forKey: "public_gists") as? Int
		publicRepos = aDecoder.decodeObject(forKey: "public_repos") as? Int
		receivedEventsUrl = aDecoder.decodeObject(forKey: "received_events_url") as? String
		reposUrl = aDecoder.decodeObject(forKey: "repos_url") as? String
		siteAdmin = aDecoder.decodeObject(forKey: "site_admin") as? Bool
		starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
		subscriptionsUrl = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
		type = aDecoder.decodeObject(forKey: "type") as? String
		updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
		url = aDecoder.decodeObject(forKey: "url") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if avatarUrl != nil{
			aCoder.encode(avatarUrl, forKey: "avatar_url")
		}
		if bio != nil{
			aCoder.encode(bio, forKey: "bio")
		}
		if blog != nil{
			aCoder.encode(blog, forKey: "blog")
		}
		if company != nil{
			aCoder.encode(company, forKey: "company")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if eventsUrl != nil{
			aCoder.encode(eventsUrl, forKey: "events_url")
		}
		if followers != nil{
			aCoder.encode(followers, forKey: "followers")
		}
		if followersUrl != nil{
			aCoder.encode(followersUrl, forKey: "followers_url")
		}
		if following != nil{
			aCoder.encode(following, forKey: "following")
		}
		if followingUrl != nil{
			aCoder.encode(followingUrl, forKey: "following_url")
		}
		if gistsUrl != nil{
			aCoder.encode(gistsUrl, forKey: "gists_url")
		}
		if gravatarId != nil{
			aCoder.encode(gravatarId, forKey: "gravatar_id")
		}
		if hireable != nil{
			aCoder.encode(hireable, forKey: "hireable")
		}
		if htmlUrl != nil{
			aCoder.encode(htmlUrl, forKey: "html_url")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if login != nil{
			aCoder.encode(login, forKey: "login")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if nodeId != nil{
			aCoder.encode(nodeId, forKey: "node_id")
		}
		if organizationsUrl != nil{
			aCoder.encode(organizationsUrl, forKey: "organizations_url")
		}
		if publicGists != nil{
			aCoder.encode(publicGists, forKey: "public_gists")
		}
		if publicRepos != nil{
			aCoder.encode(publicRepos, forKey: "public_repos")
		}
		if receivedEventsUrl != nil{
			aCoder.encode(receivedEventsUrl, forKey: "received_events_url")
		}
		if reposUrl != nil{
			aCoder.encode(reposUrl, forKey: "repos_url")
		}
		if siteAdmin != nil{
			aCoder.encode(siteAdmin, forKey: "site_admin")
		}
		if starredUrl != nil{
			aCoder.encode(starredUrl, forKey: "starred_url")
		}
		if subscriptionsUrl != nil{
			aCoder.encode(subscriptionsUrl, forKey: "subscriptions_url")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
