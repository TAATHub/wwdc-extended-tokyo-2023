import SwiftUI

struct ImageMagnificationView: View {
    var body: some View {
        ImageViewer(imageName: "photo")
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ImageViewer: UIViewRepresentable {
    let imageName: String

    func makeUIView(context: Context) -> UIImageViewerView {
        let view = UIImageViewerView(imageName: imageName)
        return view
    }

    func updateUIView(_ uiView: UIImageViewerView, context: Context) {}
}
