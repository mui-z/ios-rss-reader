import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel

    var body: some View {
        Button(action: {
            viewModel.input.didTapButton.send(())
        }, label: {
            Text("Tap!")
        })
    }
}

