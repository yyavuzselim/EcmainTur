import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var loadingProgress = 0.0
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color(hex: "b28f48")
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Ecmain Tur ile Farkı Yaşayın")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    // Loading indicator
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 4)
                            .opacity(0.3)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                        
                        Circle()
                            .trim(from: 0, to: loadingProgress)
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: 40, height: 40)
                            .rotationEffect(Angle(degrees: 270))
                    }
                    .padding(.top, 30)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    // Logo ve yazı animasyonu
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                    
                    // Loading animasyonu
                    withAnimation(.linear(duration: 2.0)) {
                        self.loadingProgress = 1.0
                    }
                    
                    // 3 saniye sonra geçiş
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
