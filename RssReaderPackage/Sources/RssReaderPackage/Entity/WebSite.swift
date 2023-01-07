//
//  File.swift
//  
//
//  Created by osushi on 2023/01/07.
//

import Foundation

struct RssFeed {
	let title: String
	let rssUrl: URL
	let lastUpdateDate: Date
	let articles: [Article]
}
