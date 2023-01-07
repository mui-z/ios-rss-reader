import SwiftUI

struct ArticleListView: View {
    @StateObject var viewModel: ArticleListViewModel

    var body: some View {
        Button(action: {
            viewModel.input.didTapButton.send(())
        }, label: {
            Text("Hello World!")
        })
    }
}

