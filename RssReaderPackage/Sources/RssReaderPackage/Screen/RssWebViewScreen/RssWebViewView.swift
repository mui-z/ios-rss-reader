import SwiftUI

struct RssWebViewView: View {
    @StateObject var viewModel: RssWebViewViewModel

    var body: some View {
        Button(action: {
            viewModel.input.didTapButton.send(())
        }, label: {
            Text("Tap!")
        })
    }
}

