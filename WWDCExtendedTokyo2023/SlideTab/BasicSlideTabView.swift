import SwiftUI

struct BasicSlideTabView: View {
    // タブの選択項目を保持する
    @State var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tag(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)
            
            Color.green
                .tag(1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)
            
            Color.blue
                .tag(2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)
        }
        .ignoresSafeArea(edges: .bottom)
        // PageTabViewStyleでページングできる
        // IndexDisplayMode.neverでインジケーター非表示
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(.white)
    }
}

struct BasicSlideTabView_Previews: PreviewProvider {
    static var previews: some View {
        BasicSlideTabView()
    }
}
