import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("TabViewでインタラクティブなタブインジケーターを作る", destination: { SlideTabSampleView() })
                NavigationLink("Imageをピンチイン・ピンチアウト・ダブルタップでズームさせる", destination: { ImageMagnificationSampleView() })
                NavigationLink("Truncated Text", destination: { TruncatedTextSampleView() })
            }
            .listStyle(.plain)
            .navigationTitle("Extended Tokyo - WWDC 2023")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SlideTabSampleView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("TabViewでの基本的なページング", destination: { BasicSlideTabView() })
                NavigationLink("横スクロール時のオフセットを取得", destination: { SlideTabOffsetView() })
                NavigationLink("インタラクティブにインジケーター位置を更新", destination: { SlideTabView() })
            }
            .listStyle(.plain)
        }
        .navigationTitle("SlideTabSample")
    }
}

struct ImageMagnificationSampleView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("基本的なズーム方法", destination: { MagnificationGestureScaleEffectView() })
                NavigationLink("拡大した画像をスクロールさせる", destination: { MagnificationGestureScrollView() })
                NavigationLink("SwiftUI + UIScrollView", destination: { ImageMagnificationView() })
            }
            .listStyle(.plain)
        }
        .navigationTitle("ImageMagnificationSample")
    }
}
