import SwiftUI

struct SlideTabOffsetView: View {
    @State var selection: Int = 0
    @State private var indicatorPosition: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            
            TabView(selection: $selection) {
                Color.red
                    .tag(0)
                    .ignoresSafeArea(edges: .bottom)
                    .overlay {
                        scrollOffsetOverlay(tag: 0, width: screenWidth)
                    }
                
                Color.blue
                    .tag(1)
                    .ignoresSafeArea(edges: .bottom)
                    .overlay {
                        scrollOffsetOverlay(tag: 1, width: screenWidth)
                    }
                
                Color.green
                    .tag(2)
                    .ignoresSafeArea(edges: .bottom)
                    .overlay {
                        scrollOffsetOverlay(tag: 2, width: screenWidth)
                    }
            }
            .ignoresSafeArea(edges: .bottom)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay {
                Text("\(indicatorPosition)")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
            }
        }
        .background(.white)
    }
    
    private func scrollOffsetOverlay(tag: Int, width: CGFloat) -> some View {
        GeometryReader { proxy in
            Color.clear
                .onChange(of: proxy.frame(in: .global)) { newValue in
                    // 表示中のタブをスワイプした時のみ処理する
                    guard selection == tag else { return }
                    // 対象タブのスワイプ量をTabBarの比率に変換して、インジケーターのoffsetを計算する
                    let offset = -(newValue.minX - (width * CGFloat(selection))) / 3
                    // インジケーター位置を更新
                    indicatorPosition = offset
                }
        }
    }
}

struct SlideTabOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        SlideTabOffsetView()
    }
}

