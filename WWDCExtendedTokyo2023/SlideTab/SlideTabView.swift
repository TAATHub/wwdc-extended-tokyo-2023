import SwiftUI

struct SlideTabView: View {
    // タブの選択項目を保持する
    @State var selection: Int = 0
    @State private var indicatorPosition: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            
            VStack(spacing: 0) {
                HStack {
                    Text("Page1")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Text("Page2")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Text("Page3")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 48)
                .overlay(alignment: .bottomLeading) {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width / 3, height: 4)
                        .offset(x: indicatorPosition, y: 0)
                }
                
                TabView(selection: $selection) {
                    Color.red
                        .tag(0)
                        .ignoresSafeArea(edges: .bottom)
                        .overlay {
                            scrollOffsetOverlay(tag: 0, width: screenWidth)
                        }
                    
                    Color.green
                        .tag(1)
                        .ignoresSafeArea(edges: .bottom)
                        .overlay {
                            scrollOffsetOverlay(tag: 1, width: screenWidth)
                        }
                    
                    Color.blue
                        .tag(2)
                        .ignoresSafeArea(edges: .bottom)
                        .overlay {
                            scrollOffsetOverlay(tag: 2, width: screenWidth)
                        }
                }
                .ignoresSafeArea(edges: .bottom)
                // PageTabViewStyleでページングできる
                // IndexDisplayMode.neverでインジケーター非表示
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
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
