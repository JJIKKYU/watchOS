import SDWebImageLottieCoder
import SDWebImageSwiftUI
import SwiftUI

public struct ContentView: View {
    @State var isAnimating: Bool = true

    public init() {
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)
        let url = URL(string: "https://assets5.lottiefiles.com/packages/lf20_GoeyCV7pi2.json")!
    }

    public var body: some View {
//        Text("あ")
        Text("고양이..")
            .font(.largeTitle)
            .padding(.leading)
            .background()
        WebImage(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_Zz37yH.json")!, isAnimating: $isAnimating)
            .resizable()
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
