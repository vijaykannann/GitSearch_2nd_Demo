//
//  RepoModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 6, 2020

import Foundation
import SwiftyJSON


class RepoModel : NSObject, NSCoding{

    var archiveUrl : String!
    var archived : Bool!
    var assigneesUrl : String!
    var blobsUrl : String!
    var branchesUrl : String!
    var cloneUrl : String!
    var collaboratorsUrl : String!
    var commentsUrl : String!
    var commitsUrl : String!
    var compareUrl : String!
    var contentsUrl : String!
    var contributorsUrl : String!
    var createdAt : String!
    var defaultBranch : String!
    var deploymentsUrl : String!
    var descriptionField : AnyObject!
    var disabled : Bool!
    var downloadsUrl : String!
    var eventsUrl : String!
    var fork : Bool!
    var forks : Int!
    var forksCount : Int!
    var forksUrl : String!
    var fullName : String!
    var gitCommitsUrl : String!
    var gitRefsUrl : String!
    var gitTagsUrl : String!
    var gitUrl : String!
    var hasDownloads : Bool!
    var hasIssues : Bool!
    var hasPages : Bool!
    var hasProjects : Bool!
    var hasWiki : Bool!
    var homepage : AnyObject!
    var hooksUrl : String!
    var htmlUrl : String!
    var id : Int!
    var issueCommentUrl : String!
    var issueEventsUrl : String!
    var issuesUrl : String!
    var keysUrl : String!
    var labelsUrl : String!
    var language : AnyObject!
    var languagesUrl : String!
    var license : AnyObject!
    var mergesUrl : String!
    var milestonesUrl : String!
    var mirrorUrl : AnyObject!
    var name : String!
    var nodeId : String!
    var notificationsUrl : String!
    var openIssues : Int!
    var openIssuesCount : Int!
    var owner : Owner!
    var privateField : Bool!
    var pullsUrl : String!
    var pushedAt : String!
    var releasesUrl : String!
    var size : Int!
    var sshUrl : String!
    var stargazersCount : Int!
    var stargazersUrl : String!
    var statusesUrl : String!
    var subscribersUrl : String!
    var subscriptionUrl : String!
    var svnUrl : String!
    var tagsUrl : String!
    var teamsUrl : String!
    var treesUrl : String!
    var updatedAt : String!
    var url : String!
    var watchers : Int!
    var watchersCount : Int!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    public required init(json: JSON) {
        archiveUrl = json["archive_url"].stringValue
        archived = json["archived"].boolValue
        assigneesUrl = json["assignees_url"].stringValue
        blobsUrl = json["blobs_url"].stringValue
        branchesUrl = json["branches_url"].stringValue
        cloneUrl = json["clone_url"].stringValue
        collaboratorsUrl = json["collaborators_url"].stringValue
        commentsUrl = json["comments_url"].stringValue
        commitsUrl = json["commits_url"].stringValue
        compareUrl = json["compare_url"].stringValue
        contentsUrl = json["contents_url"].stringValue
        contributorsUrl = json["contributors_url"].stringValue
        createdAt = json["created_at"].stringValue
        defaultBranch = json["default_branch"].stringValue
        deploymentsUrl = json["deployments_url"].stringValue
        descriptionField = json["description"] as AnyObject
        disabled = json["disabled"].boolValue
        downloadsUrl = json["downloads_url"].stringValue
        eventsUrl = json["events_url"].stringValue
        fork = json["fork"].boolValue
        forks = json["forks"].intValue
        forksCount = json["forks_count"].intValue
        forksUrl = json["forks_url"].stringValue
        fullName = json["full_name"].stringValue
        gitCommitsUrl = json["git_commits_url"].stringValue
        gitRefsUrl = json["git_refs_url"].stringValue
        gitTagsUrl = json["git_tags_url"].stringValue
        gitUrl = json["git_url"].stringValue
        hasDownloads = json["has_downloads"].boolValue
        hasIssues = json["has_issues"].boolValue
        hasPages = json["has_pages"].boolValue
        hasProjects = json["has_projects"].boolValue
        hasWiki = json["has_wiki"].boolValue
        homepage = json["homepage"] as AnyObject
        hooksUrl = json["hooks_url"].stringValue
        htmlUrl = json["html_url"].stringValue
        id = json["id"].intValue
        issueCommentUrl = json["issue_comment_url"].stringValue
        issueEventsUrl = json["issue_events_url"].stringValue
        issuesUrl = json["issues_url"].stringValue
        keysUrl = json["keys_url"].stringValue
        labelsUrl = json["labels_url"].stringValue
        language = json["language"] as AnyObject
        languagesUrl = json["languages_url"].stringValue
        license = json["license"] as AnyObject
        mergesUrl = json["merges_url"].stringValue
        milestonesUrl = json["milestones_url"].stringValue
        mirrorUrl = json["mirror_url"] as AnyObject
        name = json["name"].stringValue
        nodeId = json["node_id"].stringValue
        notificationsUrl = json["notifications_url"].stringValue
        openIssues = json["open_issues"].intValue
        openIssuesCount = json["open_issues_count"].intValue
        let ownerJson = json["owner"]
        if !ownerJson.isEmpty{
            owner = Owner(object: ownerJson)
        }
        privateField = json["private"].boolValue
        pullsUrl = json["pulls_url"].stringValue
        pushedAt = json["pushed_at"].stringValue
        releasesUrl = json["releases_url"].stringValue
        size = json["size"].intValue
        sshUrl = json["ssh_url"].stringValue
        stargazersCount = json["stargazers_count"].intValue
        stargazersUrl = json["stargazers_url"].stringValue
        statusesUrl = json["statuses_url"].stringValue
        subscribersUrl = json["subscribers_url"].stringValue
        subscriptionUrl = json["subscription_url"].stringValue
        svnUrl = json["svn_url"].stringValue
        tagsUrl = json["tags_url"].stringValue
        teamsUrl = json["teams_url"].stringValue
        treesUrl = json["trees_url"].stringValue
        updatedAt = json["updated_at"].stringValue
        url = json["url"].stringValue
        watchers = json["watchers"].intValue
        watchersCount = json["watchers_count"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if archiveUrl != nil{
        	dictionary["archive_url"] = archiveUrl
        }
        if archived != nil{
        	dictionary["archived"] = archived
        }
        if assigneesUrl != nil{
        	dictionary["assignees_url"] = assigneesUrl
        }
        if blobsUrl != nil{
        	dictionary["blobs_url"] = blobsUrl
        }
        if branchesUrl != nil{
        	dictionary["branches_url"] = branchesUrl
        }
        if cloneUrl != nil{
        	dictionary["clone_url"] = cloneUrl
        }
        if collaboratorsUrl != nil{
        	dictionary["collaborators_url"] = collaboratorsUrl
        }
        if commentsUrl != nil{
        	dictionary["comments_url"] = commentsUrl
        }
        if commitsUrl != nil{
        	dictionary["commits_url"] = commitsUrl
        }
        if compareUrl != nil{
        	dictionary["compare_url"] = compareUrl
        }
        if contentsUrl != nil{
        	dictionary["contents_url"] = contentsUrl
        }
        if contributorsUrl != nil{
        	dictionary["contributors_url"] = contributorsUrl
        }
        if createdAt != nil{
        	dictionary["created_at"] = createdAt
        }
        if defaultBranch != nil{
        	dictionary["default_branch"] = defaultBranch
        }
        if deploymentsUrl != nil{
        	dictionary["deployments_url"] = deploymentsUrl
        }
        if descriptionField != nil{
        	dictionary["description"] = descriptionField
        }
        if disabled != nil{
        	dictionary["disabled"] = disabled
        }
        if downloadsUrl != nil{
        	dictionary["downloads_url"] = downloadsUrl
        }
        if eventsUrl != nil{
        	dictionary["events_url"] = eventsUrl
        }
        if fork != nil{
        	dictionary["fork"] = fork
        }
        if forks != nil{
        	dictionary["forks"] = forks
        }
        if forksCount != nil{
        	dictionary["forks_count"] = forksCount
        }
        if forksUrl != nil{
        	dictionary["forks_url"] = forksUrl
        }
        if fullName != nil{
        	dictionary["full_name"] = fullName
        }
        if gitCommitsUrl != nil{
        	dictionary["git_commits_url"] = gitCommitsUrl
        }
        if gitRefsUrl != nil{
        	dictionary["git_refs_url"] = gitRefsUrl
        }
        if gitTagsUrl != nil{
        	dictionary["git_tags_url"] = gitTagsUrl
        }
        if gitUrl != nil{
        	dictionary["git_url"] = gitUrl
        }
        if hasDownloads != nil{
        	dictionary["has_downloads"] = hasDownloads
        }
        if hasIssues != nil{
        	dictionary["has_issues"] = hasIssues
        }
        if hasPages != nil{
        	dictionary["has_pages"] = hasPages
        }
        if hasProjects != nil{
        	dictionary["has_projects"] = hasProjects
        }
        if hasWiki != nil{
        	dictionary["has_wiki"] = hasWiki
        }
        if homepage != nil{
        	dictionary["homepage"] = homepage
        }
        if hooksUrl != nil{
        	dictionary["hooks_url"] = hooksUrl
        }
        if htmlUrl != nil{
        	dictionary["html_url"] = htmlUrl
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if issueCommentUrl != nil{
        	dictionary["issue_comment_url"] = issueCommentUrl
        }
        if issueEventsUrl != nil{
        	dictionary["issue_events_url"] = issueEventsUrl
        }
        if issuesUrl != nil{
        	dictionary["issues_url"] = issuesUrl
        }
        if keysUrl != nil{
        	dictionary["keys_url"] = keysUrl
        }
        if labelsUrl != nil{
        	dictionary["labels_url"] = labelsUrl
        }
        if language != nil{
        	dictionary["language"] = language
        }
        if languagesUrl != nil{
        	dictionary["languages_url"] = languagesUrl
        }
        if license != nil{
        	dictionary["license"] = license
        }
        if mergesUrl != nil{
        	dictionary["merges_url"] = mergesUrl
        }
        if milestonesUrl != nil{
        	dictionary["milestones_url"] = milestonesUrl
        }
        if mirrorUrl != nil{
        	dictionary["mirror_url"] = mirrorUrl
        }
        if name != nil{
        	dictionary["name"] = name
        }
        if nodeId != nil{
        	dictionary["node_id"] = nodeId
        }
        if notificationsUrl != nil{
        	dictionary["notifications_url"] = notificationsUrl
        }
        if openIssues != nil{
        	dictionary["open_issues"] = openIssues
        }
        if openIssuesCount != nil{
        	dictionary["open_issues_count"] = openIssuesCount
        }
        if owner != nil{
        	dictionary["owner"] = owner.toDictionary()
        }
        if privateField != nil{
        	dictionary["private"] = privateField
        }
        if pullsUrl != nil{
        	dictionary["pulls_url"] = pullsUrl
        }
        if pushedAt != nil{
        	dictionary["pushed_at"] = pushedAt
        }
        if releasesUrl != nil{
        	dictionary["releases_url"] = releasesUrl
        }
        if size != nil{
        	dictionary["size"] = size
        }
        if sshUrl != nil{
        	dictionary["ssh_url"] = sshUrl
        }
        if stargazersCount != nil{
        	dictionary["stargazers_count"] = stargazersCount
        }
        if stargazersUrl != nil{
        	dictionary["stargazers_url"] = stargazersUrl
        }
        if statusesUrl != nil{
        	dictionary["statuses_url"] = statusesUrl
        }
        if subscribersUrl != nil{
        	dictionary["subscribers_url"] = subscribersUrl
        }
        if subscriptionUrl != nil{
        	dictionary["subscription_url"] = subscriptionUrl
        }
        if svnUrl != nil{
        	dictionary["svn_url"] = svnUrl
        }
        if tagsUrl != nil{
        	dictionary["tags_url"] = tagsUrl
        }
        if teamsUrl != nil{
        	dictionary["teams_url"] = teamsUrl
        }
        if treesUrl != nil{
        	dictionary["trees_url"] = treesUrl
        }
        if updatedAt != nil{
        	dictionary["updated_at"] = updatedAt
        }
        if url != nil{
        	dictionary["url"] = url
        }
        if watchers != nil{
        	dictionary["watchers"] = watchers
        }
        if watchersCount != nil{
        	dictionary["watchers_count"] = watchersCount
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		archiveUrl = aDecoder.decodeObject(forKey: "archive_url") as? String
		archived = aDecoder.decodeObject(forKey: "archived") as? Bool
		assigneesUrl = aDecoder.decodeObject(forKey: "assignees_url") as? String
		blobsUrl = aDecoder.decodeObject(forKey: "blobs_url") as? String
		branchesUrl = aDecoder.decodeObject(forKey: "branches_url") as? String
		cloneUrl = aDecoder.decodeObject(forKey: "clone_url") as? String
		collaboratorsUrl = aDecoder.decodeObject(forKey: "collaborators_url") as? String
		commentsUrl = aDecoder.decodeObject(forKey: "comments_url") as? String
		commitsUrl = aDecoder.decodeObject(forKey: "commits_url") as? String
		compareUrl = aDecoder.decodeObject(forKey: "compare_url") as? String
		contentsUrl = aDecoder.decodeObject(forKey: "contents_url") as? String
		contributorsUrl = aDecoder.decodeObject(forKey: "contributors_url") as? String
		createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
		defaultBranch = aDecoder.decodeObject(forKey: "default_branch") as? String
		deploymentsUrl = aDecoder.decodeObject(forKey: "deployments_url") as? String
		descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
		disabled = aDecoder.decodeObject(forKey: "disabled") as? Bool
		downloadsUrl = aDecoder.decodeObject(forKey: "downloads_url") as? String
		eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
		fork = aDecoder.decodeObject(forKey: "fork") as? Bool
		forks = aDecoder.decodeObject(forKey: "forks") as? Int
		forksCount = aDecoder.decodeObject(forKey: "forks_count") as? Int
		forksUrl = aDecoder.decodeObject(forKey: "forks_url") as? String
		fullName = aDecoder.decodeObject(forKey: "full_name") as? String
		gitCommitsUrl = aDecoder.decodeObject(forKey: "git_commits_url") as? String
		gitRefsUrl = aDecoder.decodeObject(forKey: "git_refs_url") as? String
		gitTagsUrl = aDecoder.decodeObject(forKey: "git_tags_url") as? String
		gitUrl = aDecoder.decodeObject(forKey: "git_url") as? String
		hasDownloads = aDecoder.decodeObject(forKey: "has_downloads") as? Bool
		hasIssues = aDecoder.decodeObject(forKey: "has_issues") as? Bool
		hasPages = aDecoder.decodeObject(forKey: "has_pages") as? Bool
		hasProjects = aDecoder.decodeObject(forKey: "has_projects") as? Bool
		hasWiki = aDecoder.decodeObject(forKey: "has_wiki") as? Bool
		homepage = aDecoder.decodeObject(forKey: "homepage") as? AnyObject
		hooksUrl = aDecoder.decodeObject(forKey: "hooks_url") as? String
		htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		issueCommentUrl = aDecoder.decodeObject(forKey: "issue_comment_url") as? String
		issueEventsUrl = aDecoder.decodeObject(forKey: "issue_events_url") as? String
		issuesUrl = aDecoder.decodeObject(forKey: "issues_url") as? String
		keysUrl = aDecoder.decodeObject(forKey: "keys_url") as? String
		labelsUrl = aDecoder.decodeObject(forKey: "labels_url") as? String
		language = aDecoder.decodeObject(forKey: "language") as? AnyObject
		languagesUrl = aDecoder.decodeObject(forKey: "languages_url") as? String
		license = aDecoder.decodeObject(forKey: "license") as? AnyObject
		mergesUrl = aDecoder.decodeObject(forKey: "merges_url") as? String
		milestonesUrl = aDecoder.decodeObject(forKey: "milestones_url") as? String
		mirrorUrl = aDecoder.decodeObject(forKey: "mirror_url") as? AnyObject
		name = aDecoder.decodeObject(forKey: "name") as? String
		nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
		notificationsUrl = aDecoder.decodeObject(forKey: "notifications_url") as? String
		openIssues = aDecoder.decodeObject(forKey: "open_issues") as? Int
		openIssuesCount = aDecoder.decodeObject(forKey: "open_issues_count") as? Int
		owner = aDecoder.decodeObject(forKey: "owner") as? Owner
		privateField = aDecoder.decodeObject(forKey: "private") as? Bool
		pullsUrl = aDecoder.decodeObject(forKey: "pulls_url") as? String
		pushedAt = aDecoder.decodeObject(forKey: "pushed_at") as? String
		releasesUrl = aDecoder.decodeObject(forKey: "releases_url") as? String
		size = aDecoder.decodeObject(forKey: "size") as? Int
		sshUrl = aDecoder.decodeObject(forKey: "ssh_url") as? String
		stargazersCount = aDecoder.decodeObject(forKey: "stargazers_count") as? Int
		stargazersUrl = aDecoder.decodeObject(forKey: "stargazers_url") as? String
		statusesUrl = aDecoder.decodeObject(forKey: "statuses_url") as? String
		subscribersUrl = aDecoder.decodeObject(forKey: "subscribers_url") as? String
		subscriptionUrl = aDecoder.decodeObject(forKey: "subscription_url") as? String
		svnUrl = aDecoder.decodeObject(forKey: "svn_url") as? String
		tagsUrl = aDecoder.decodeObject(forKey: "tags_url") as? String
		teamsUrl = aDecoder.decodeObject(forKey: "teams_url") as? String
		treesUrl = aDecoder.decodeObject(forKey: "trees_url") as? String
		updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
		url = aDecoder.decodeObject(forKey: "url") as? String
		watchers = aDecoder.decodeObject(forKey: "watchers") as? Int
		watchersCount = aDecoder.decodeObject(forKey: "watchers_count") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if archiveUrl != nil{
			aCoder.encode(archiveUrl, forKey: "archive_url")
		}
		if archived != nil{
			aCoder.encode(archived, forKey: "archived")
		}
		if assigneesUrl != nil{
			aCoder.encode(assigneesUrl, forKey: "assignees_url")
		}
		if blobsUrl != nil{
			aCoder.encode(blobsUrl, forKey: "blobs_url")
		}
		if branchesUrl != nil{
			aCoder.encode(branchesUrl, forKey: "branches_url")
		}
		if cloneUrl != nil{
			aCoder.encode(cloneUrl, forKey: "clone_url")
		}
		if collaboratorsUrl != nil{
			aCoder.encode(collaboratorsUrl, forKey: "collaborators_url")
		}
		if commentsUrl != nil{
			aCoder.encode(commentsUrl, forKey: "comments_url")
		}
		if commitsUrl != nil{
			aCoder.encode(commitsUrl, forKey: "commits_url")
		}
		if compareUrl != nil{
			aCoder.encode(compareUrl, forKey: "compare_url")
		}
		if contentsUrl != nil{
			aCoder.encode(contentsUrl, forKey: "contents_url")
		}
		if contributorsUrl != nil{
			aCoder.encode(contributorsUrl, forKey: "contributors_url")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if defaultBranch != nil{
			aCoder.encode(defaultBranch, forKey: "default_branch")
		}
		if deploymentsUrl != nil{
			aCoder.encode(deploymentsUrl, forKey: "deployments_url")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if disabled != nil{
			aCoder.encode(disabled, forKey: "disabled")
		}
		if downloadsUrl != nil{
			aCoder.encode(downloadsUrl, forKey: "downloads_url")
		}
		if eventsUrl != nil{
			aCoder.encode(eventsUrl, forKey: "events_url")
		}
		if fork != nil{
			aCoder.encode(fork, forKey: "fork")
		}
		if forks != nil{
			aCoder.encode(forks, forKey: "forks")
		}
		if forksCount != nil{
			aCoder.encode(forksCount, forKey: "forks_count")
		}
		if forksUrl != nil{
			aCoder.encode(forksUrl, forKey: "forks_url")
		}
		if fullName != nil{
			aCoder.encode(fullName, forKey: "full_name")
		}
		if gitCommitsUrl != nil{
			aCoder.encode(gitCommitsUrl, forKey: "git_commits_url")
		}
		if gitRefsUrl != nil{
			aCoder.encode(gitRefsUrl, forKey: "git_refs_url")
		}
		if gitTagsUrl != nil{
			aCoder.encode(gitTagsUrl, forKey: "git_tags_url")
		}
		if gitUrl != nil{
			aCoder.encode(gitUrl, forKey: "git_url")
		}
		if hasDownloads != nil{
			aCoder.encode(hasDownloads, forKey: "has_downloads")
		}
		if hasIssues != nil{
			aCoder.encode(hasIssues, forKey: "has_issues")
		}
		if hasPages != nil{
			aCoder.encode(hasPages, forKey: "has_pages")
		}
		if hasProjects != nil{
			aCoder.encode(hasProjects, forKey: "has_projects")
		}
		if hasWiki != nil{
			aCoder.encode(hasWiki, forKey: "has_wiki")
		}
		if homepage != nil{
			aCoder.encode(homepage, forKey: "homepage")
		}
		if hooksUrl != nil{
			aCoder.encode(hooksUrl, forKey: "hooks_url")
		}
		if htmlUrl != nil{
			aCoder.encode(htmlUrl, forKey: "html_url")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if issueCommentUrl != nil{
			aCoder.encode(issueCommentUrl, forKey: "issue_comment_url")
		}
		if issueEventsUrl != nil{
			aCoder.encode(issueEventsUrl, forKey: "issue_events_url")
		}
		if issuesUrl != nil{
			aCoder.encode(issuesUrl, forKey: "issues_url")
		}
		if keysUrl != nil{
			aCoder.encode(keysUrl, forKey: "keys_url")
		}
		if labelsUrl != nil{
			aCoder.encode(labelsUrl, forKey: "labels_url")
		}
		if language != nil{
			aCoder.encode(language, forKey: "language")
		}
		if languagesUrl != nil{
			aCoder.encode(languagesUrl, forKey: "languages_url")
		}
		if license != nil{
			aCoder.encode(license, forKey: "license")
		}
		if mergesUrl != nil{
			aCoder.encode(mergesUrl, forKey: "merges_url")
		}
		if milestonesUrl != nil{
			aCoder.encode(milestonesUrl, forKey: "milestones_url")
		}
		if mirrorUrl != nil{
			aCoder.encode(mirrorUrl, forKey: "mirror_url")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if nodeId != nil{
			aCoder.encode(nodeId, forKey: "node_id")
		}
		if notificationsUrl != nil{
			aCoder.encode(notificationsUrl, forKey: "notifications_url")
		}
		if openIssues != nil{
			aCoder.encode(openIssues, forKey: "open_issues")
		}
		if openIssuesCount != nil{
			aCoder.encode(openIssuesCount, forKey: "open_issues_count")
		}
		if owner != nil{
			aCoder.encode(owner, forKey: "owner")
		}
		if privateField != nil{
			aCoder.encode(privateField, forKey: "private")
		}
		if pullsUrl != nil{
			aCoder.encode(pullsUrl, forKey: "pulls_url")
		}
		if pushedAt != nil{
			aCoder.encode(pushedAt, forKey: "pushed_at")
		}
		if releasesUrl != nil{
			aCoder.encode(releasesUrl, forKey: "releases_url")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if sshUrl != nil{
			aCoder.encode(sshUrl, forKey: "ssh_url")
		}
		if stargazersCount != nil{
			aCoder.encode(stargazersCount, forKey: "stargazers_count")
		}
		if stargazersUrl != nil{
			aCoder.encode(stargazersUrl, forKey: "stargazers_url")
		}
		if statusesUrl != nil{
			aCoder.encode(statusesUrl, forKey: "statuses_url")
		}
		if subscribersUrl != nil{
			aCoder.encode(subscribersUrl, forKey: "subscribers_url")
		}
		if subscriptionUrl != nil{
			aCoder.encode(subscriptionUrl, forKey: "subscription_url")
		}
		if svnUrl != nil{
			aCoder.encode(svnUrl, forKey: "svn_url")
		}
		if tagsUrl != nil{
			aCoder.encode(tagsUrl, forKey: "tags_url")
		}
		if teamsUrl != nil{
			aCoder.encode(teamsUrl, forKey: "teams_url")
		}
		if treesUrl != nil{
			aCoder.encode(treesUrl, forKey: "trees_url")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if watchers != nil{
			aCoder.encode(watchers, forKey: "watchers")
		}
		if watchersCount != nil{
			aCoder.encode(watchersCount, forKey: "watchers_count")
		}

	}

}
