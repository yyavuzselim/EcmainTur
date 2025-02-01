import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Anasayfa")
            }
            
            NavigationStack {
                ContactView()
            }
            .tabItem {
                Image(systemName: "envelope.fill")
                Text("İletişim")
            }
        }
        .accentColor(Color(hex: "b28f48")) // Tab bar rengi altın rengine değiştirildi
    }
}

struct HomeView: View {
    @State private var currentBanner = 0
    
    struct BannerData {
        let image: String
        let title: String
        let subtitle: String
    }
    
    let banners = [
        BannerData(image: "banner1", title: "Umre Turları", subtitle: "Kutsal topraklara yolculuk"),
        BannerData(image: "banner2", title: "Ramazan Umresi", subtitle: "Ramazan ayına özel programlar"),
        BannerData(image: "banner3", title: "Hac Organizasyonu", subtitle: "Profosyonel hac hizmeti")
    ]
    
    let categories = [
        (icon: "moon.stars.fill", title: "Umre\nTurları"),
        (icon: "building.columns.fill", title: "Hac\nTurları"),
        (icon: "building.2.fill", title: "Otellerimiz"),
        (icon: "cross.case.fill", title: "Sağlık\nTurizmi")
    ]
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Özel başlık tasarımı
                HStack {
                    // Logo ve şirket adı
                    HStack(spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        
                        Text("Ecmain Tur")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    // Hakkımızda butonu
                    NavigationLink(destination: Text("Hakkımızda Sayfası")) {
                        Text("Hakkımızda")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "b28f48"))
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 2, y: 2)
                
                // Banner
                TabView {
                    ForEach(0..<banners.count, id: \.self) { index in
                        GeometryReader { geometry in
                            ZStack(alignment: .bottomLeading) {
                                // Banner görsel
                                Image(banners[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                
                                // Gradient ve yazılar
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(banners[index].title)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(banners[index].subtitle)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.black.opacity(0.7),
                                            Color.black.opacity(0)
                                        ]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .tag(index)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .padding(.horizontal)
                .padding(.vertical)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .onReceive(timer) { _ in
                    withAnimation {
                        currentBanner = (currentBanner + 1) % banners.count
                    }
                }
                
                // Kategoriler
                VStack(alignment: .leading, spacing: 15) {
                    Text("Kategoriler")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12)
                    ], spacing: 12) {
                        ForEach(categories.indices, id: \.self) { index in
                            if categories[index].title == "Umre\nTurları" {
                                NavigationLink(destination: UmreToursView()) {
                                    CategoryCard(icon: categories[index].icon,
                                              title: categories[index].title)
                                }
                            } else if categories[index].title == "Hac\nTurları" {
                                NavigationLink(destination: HacToursView()) {
                                    CategoryCard(icon: categories[index].icon,
                                              title: categories[index].title)
                                }
                            } else if categories[index].title == "Otellerimiz" {
                                NavigationLink(destination: HotelsView()) {
                                    CategoryCard(icon: categories[index].icon,
                                              title: categories[index].title)
                                }
                            } else {
                                NavigationLink(destination: Text(categories[index].title)) {
                                    CategoryCard(icon: categories[index].icon,
                                              title: categories[index].title)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                }
                .background(Color.white)
            }
        }
        .background(Color.white) // Ana arka plan rengi
        .navigationBarHidden(true)
    }
}

struct CategoryCard: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(Color(hex: "b28f48")) // İkon rengi altın rengine değiştirildi
                .frame(width: 60, height: 60)
                .background(Color(hex: "b28f48").opacity(0.1)) // İkon arka plan rengi
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Hex renk kodu için extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
