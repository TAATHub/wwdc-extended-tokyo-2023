import SwiftUI



// ----------

//struct ImageMagnificationView: View {
//    @State private var aspectRatio: CGFloat = 1.0
//    @State private var currentScale: CGFloat = 1.0
//    @State private var lastMagnificationValue: CGFloat = 1.0
//
//    var body: some View {
//        GeometryReader { proxy in
//            ScrollView([.horizontal, .vertical], showsIndicators: false) {
//                Image("photo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: proxy.size.width)
//                    // backgroundでGeometryReaderを使うことで、対象のViewのサイズを取得できる
//                    .background(GeometryReader { imageGeometry in
//                        Color.clear
//                            .onAppear {
//                                aspectRatio = imageGeometry.size.width / imageGeometry.size.height
//                            }
//                    })
//                    .frame(width: proxy.size.width * currentScale,
//                           height: proxy.size.width / aspectRatio * currentScale,
//                           alignment: .center)
//                    .scaleEffect(currentScale)
//                    .gesture(magnification)
//            }
//            .background(.black)
//            .ignoresSafeArea()
//        }
//    }
//
//    var magnification: some Gesture {
//        MagnificationGesture()
//            .onChanged { value in
//                // 前回の拡大率に対する今回の拡大率の割合
//                let changeRate = value / lastMagnificationValue
//                // 前回からの拡大率の変化分を考慮した現在のスケールを計算
//                currentScale *= changeRate
//                // 最小・最大スケールの範囲内に収める
//                currentScale = min(max(1.0, currentScale), 10.0)
//                // 拡大率を保持
//                lastMagnificationValue = value
//            }
//            .onEnded { value in
//                // ジェスチャー開始時は1.0から始まるため、ジェスチャー終了時に1.0に戻す
//                lastMagnificationValue = 1.0
//            }
//    }
//}

// ----------

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
