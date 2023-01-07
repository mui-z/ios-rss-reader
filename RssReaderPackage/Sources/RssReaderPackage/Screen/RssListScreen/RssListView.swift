import SwiftUI

struct RssListView: View {
    @StateObject var viewModel: RssListViewModel

    var body: some View {
		List {
			HStack {
				Text("ios new site")
				Spacer()
			}
			HStack {
				Text("ios new site")
				Spacer()
			}
		}
    }
}

