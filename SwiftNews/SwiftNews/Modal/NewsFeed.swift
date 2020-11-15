//
//  NewsFeed.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-12.
//  Copyright © 2020 JA. All rights reserved.
//

struct NewsFeed: Decodable {
    var approved_at_utc: String?
    var subreddit: String?
    let selftext: String?
    let authorFullname: String?
    let saved: Int = 0
    let modReasonTitle: String?
    let gilded: Int?
    let clicked: Bool?
    let title: String?
    let linkFlairRichtext: [Int] = []
    let subredditNamePrefixed: String?
    let hidden: Bool?
    let pwls: Int?
    let linkFlairCSSClass: String?
    let downs: Int?
    let thumbnailHeight:Int?
    let topAwardedType: Int?
    let hideScore: Bool?
    let name: String?
    let quarantine: Bool?
    let linkFlairTextColor: String?
    let upvoteRatio: Double?
    let authorFlairBackgroundColor: String?
    let subredditType: String?
    let ups:Int?
    let totalAwardsReceived: Int?
    let mediaEmbed: MediaEmbed?
    let thumbnailWidth:Double?
    let authorFlairTemplateID: String?
    let isOriginalContent: Bool?
    let userReports: [Int] = []
    let secureMedia: MediaModel?
    let isRedditMediaDomain, isMeta: Bool?
    let category: String?
    let linkFlairText: String?
    let canModPost: Bool?
    let score: Int?
    let approvedBy: String?
    let authorPremium: Bool?
    let thumbnail: String?
    let edited: Bool?
    let authorFlairCSSClass: String?
    let authorFlairRichtext: [Int] = []
    let gildings: [Int] = []
    let contentCategories: String?
    let isSelf: Bool?
    let modNote: String?
    let created: Int?
    let linkFlairType: String?
    let wls: Int?
    let removedByCategory: String?
    let bannedBy: String?
    let authorFlairType: String?
    let domain: String?
    let allowLiveComments: Bool?
    let selftextHTML: String?
    let likes, suggestedSort, bannedAtUTC, viewCount: String?
    let archived, noFollow, isCrosspostable, pinned: Bool?
    let over18: Bool?
    let allAwardings : [Int] = []
    let awarders: [Int] = []
    let mediaOnly, canGild, spoiler, locked: Bool?
    let authorFlairText: String?
    let treatmentTags: [String]?
    let visited: Bool?
    let removedBy, numReports, distinguished: String?
    let subredditID: String?
    let modReasonBy, removalReason: String?
    let linkFlairBackgroundColor, id: String?
    let isRobotIndexable: Bool?
    let reportReasons: String?
    let author: String?
    let discussionType: String?
    let numComments: Int?
    let sendReplies: Bool?
    let whitelistStatus: String?
    let contestMode: Bool?
    let modReports: [Int] = []
    let authorPatreonFlair: Bool?
    let authorFlairTextColor, permalink, parentWhitelistStatus: String?
    let stickied: Bool?
    let url: String?
    let subredditSubscribers, createdUTC, numCrossposts: Int?
    let media: MediaModel?
    let isVideo: Bool?
    
    var titleHeight:Int = 0
    var imgHeight:Int = 0
    var isValidUrl:Bool = false

     enum CodingKeys: String, CodingKey {
        case approved_at_utc = "approved_at_utc"
        case subreddit = "subreddit"
        case selftext = "selftext"
        case authorFullname = "author_fullname"
        case saved = "saved"
        case modReasonTitle = "mod_reason_title"
        case gilded = "gilded"
        case clicked = "clicked"
        case title = "title"
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden = "hidden"
        case pwls = "pwls"
        case linkFlairCSSClass = "link_flair_css_class"
        case downs = "downs"
        case thumbnailHeight = "thumbnail_height"
        case topAwardedType = "top_awarded_type"
        case hideScore = "hide_score"
        case name = "name"
        case quarantine = "quarantine"
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups = "ups"
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category = "category"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score = "score"
        case approvedBy = "approved_by"
        case authorPremium = "author_premium"
        case thumbnail = "thumbnail"
        case edited = "edited"
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings = "gildings"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created = "created"
        case linkFlairType = "link_flair_type"
        case wls = "wls"
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain = "domain"
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes = "likes"
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived = "archived"
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned = "pinned"
        case over18 = "over_18"
        case allAwardings = "all_awardings"
        case awarders = "awarders"
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler = "spoiler"
        case locked = "locked"
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited = "visited"
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished = "distinguished"
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id = "id"
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author = "author"
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink = "permalink"
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied = "stickied"
        case url = "url"
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media = "media"
        case isVideo = "is_video"
    }

 
}

