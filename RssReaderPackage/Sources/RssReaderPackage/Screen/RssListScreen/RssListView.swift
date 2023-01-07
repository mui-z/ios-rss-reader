import SwiftUI

struct RssListView: View {
	@StateObject var viewModel: RssListViewModel
	
	var body: some View {
		List {
			rssCell
			rssCell
			rssCell
		}
	}
}

private extension RssListView {
	
	var rssCell: some View {
		VStack(alignment: .leading) {
			Text("iOS News Site")
				.padding(.trailing)
				.padding(.bottom, 1)
			
			Text("2023/1/7")
				.font(.caption)
				.foregroundColor(.gray)
		}
	}
}
