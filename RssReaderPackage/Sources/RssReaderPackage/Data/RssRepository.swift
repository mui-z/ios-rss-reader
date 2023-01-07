//
//  File.swift
//  
//
//  Created by osushi on 2023/01/07.
//

import Foundation
import Alamofire
import FeedKit

protocol RssRepositoryProtocol {
	func getRssFeed(urlString: String) async throws -> RssFeed
}

struct RssRepository: RssRepositoryProtocol {
	func getRssFeed(urlString: String) async throws -> RssFeed {
		
		let parser = FeedParser(URL: URL(string: urlString)!)
		
		let result = parser.parse()
		
		switch result {
		case .success(let feed):
			switch feed {
			case let .atom(feed):
				return feed.toRssFeed()
			case let .rss(feed):
				return feed.toRssFeed()
			case let .json(feed):
				return feed.toRssFeed()
			}
		case .failure(let error):
			print(error)
			throw error
		}
	}
}

extension AtomFeed {
	func toRssFeed() -> RssFeed {
		let articles = self.entries?.map { entry in
				Article(title: entry.title ?? "no title", url: URL(string: (entry.id!))!, summary: entry.summary?.value ?? "")
			} ?? []
		
		return RssFeed(title: self.title ?? "no title", rssUrl: URL(string: self.id!)!, lastUpdateDate: self.updated!, articles: articles)
	}
}

extension RSSFeed {
	func toRssFeed() -> RssFeed {
		let articles = self.items?.map { item in
			Article(title: item.title ?? "no title", url: URL(string: item.link!)!, summary: item.comments ?? "")
		} ?? []
		
		return RssFeed(title: self.title ?? "no title", rssUrl: URL(string: self.link!)!, lastUpdateDate: self.pubDate!, articles: articles)
	}
}

extension JSONFeed {
	func toRssFeed() -> RssFeed {
		let articles = self.items?.map { item in
			Article(title: item.title ?? "no title", url: URL(string: item.url!)!, summary: item.summary ?? "")
		} ?? []
		
		return RssFeed(title: self.title ?? "no title", rssUrl: URL(string: self.feedUrl!)!, lastUpdateDate: Date.now, articles: articles)
	}
}
