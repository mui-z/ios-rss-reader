import SwiftUI

public struct RootView: View {
    @StateObject var viewModel: RootViewModel
	
	public init() {
		self._viewModel = StateObject(wrappedValue: RootViewModel())
	}

    public var body: some View {
		NavigationStack {
			RssListView(viewModel: .init())
				.navigationTitle("RSS List")
		}
    }
}

