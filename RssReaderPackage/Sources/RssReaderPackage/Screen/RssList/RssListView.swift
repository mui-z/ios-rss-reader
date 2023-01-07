import SwiftUI

struct RssListView: View {
    @StateObject var viewModel: RssListViewModel

    var body: some View {
        Button(action: {
            viewModel.input.didTapButton.send(())
        }, label: {
            Text("Tap!")
        })
    }
}

