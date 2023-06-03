import SwiftUI

struct MagnificationGestureScaleEffectView: View {
    @State private var currentScale: CGFloat = 1.0
    @State private var lastMagnificationValue: CGFloat = 1.0

    var body: some View {
        Image("photo")
            .resizable()
            .scaledToFit()
            .scaleEffect(currentScale)
            .gesture(MagnificationGesture().onChanged({ value in
                // 前回の拡大率に対する今回の拡大率の割合
                let changeRate = value / lastMagnificationValue
                // 前回からの拡大率の変化分を考慮した現在のスケールを計算
                currentScale *= changeRate
                // 最小・最大スケールの範囲内に収める
                currentScale = min(max(1.0, currentScale), 10.0)
                // 拡大率を保持
                lastMagnificationValue = value
            }).onEnded({ value in
                // ジェスチャー開始時は1.0から始まるため、ジェスチャー終了時に1.0に戻す
                lastMagnificationValue = 1.0
            }))
    }
}

struct MagnificationGestureScaleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureScaleEffectView()
    }
}
