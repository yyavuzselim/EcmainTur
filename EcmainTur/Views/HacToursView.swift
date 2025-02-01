import SwiftUI

struct HacToursView: View {
    let tours = HacTour.sampleTours
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Başlık
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "b28f48").opacity(0.8), Color(hex: "b28f48")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(height: 120)
                    
                    VStack {
                        Text("Hac Turları")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Kutsal yolculuğunuza rehberlik ediyoruz")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                // Turlar
                VStack(spacing: 20) {
                    ForEach(tours) { tour in
                        NavigationLink {
                            HacTourDetailView(tour: tour)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            HacTourCard(tour: tour)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.05))
    }
}

struct HacTourCard: View {
    let tour: HacTour
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Tour Image
            ZStack(alignment: .bottomLeading) {
                Image(tour.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(15)
                
                // Package Type and Price
                VStack(alignment: .leading, spacing: 8) {
                    Text(tour.packageType)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "b28f48").opacity(0.9))
                        .cornerRadius(6)
                    
                    Text(tour.price)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(6)
                }
                .padding(12)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(tour.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(tour.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Hotel Info
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 15) {
                        Label(tour.duration, systemImage: "clock.fill")
                        Label(tour.mekkeHotel.distance, systemImage: "location.fill")
                    }
                    .font(.caption)
                    .foregroundColor(Color(hex: "b28f48"))
                    
                    HStack(spacing: 15) {
                        Text("Mekke: \(tour.mekkeHotel.name)")
                        Text("Medine: \(tour.medineHotel.name)")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 15)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct HacTourDetailView: View {
    let tour: HacTour
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image Carousel
                TabView {
                    ForEach(tour.images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle())
                
                VStack(alignment: .leading, spacing: 20) {
                    // Title and Package Type
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(tour.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(tour.packageType)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(hex: "b28f48"))
                                .cornerRadius(6)
                        }
                        
                        Text(tour.subtitle)
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    
                    // Price and Duration
                    HStack {
                        Text(tour.price)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color(hex: "b28f48"))
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        Label(tour.duration, systemImage: "clock.fill")
                            .foregroundColor(Color(hex: "b28f48"))
                    }
                    
                    // Description
                    Text("Program Hakkında")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(tour.description)
                        .foregroundColor(.gray)
                    
                    // Hotels
                    Group {
                        Text("Oteller")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            // Mekke Hotel
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Mekke: \(tour.mekkeHotel.name)")
                                    .font(.headline)
                                
                                HStack {
                                    ForEach(0..<tour.mekkeHotel.stars, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color(hex: "b28f48"))
                                    }
                                }
                                
                                Text("Mesafe: \(tour.mekkeHotel.distance)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                ForEach(tour.mekkeHotel.features, id: \.self) { feature in
                                    Label(feature, systemImage: "checkmark.circle.fill")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            
                            // Medine Hotel
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Medine: \(tour.medineHotel.name)")
                                    .font(.headline)
                                
                                HStack {
                                    ForEach(0..<tour.medineHotel.stars, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color(hex: "b28f48"))
                                    }
                                }
                                
                                Text("Mesafe: \(tour.medineHotel.distance)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                ForEach(tour.medineHotel.features, id: \.self) { feature in
                                    Label(feature, systemImage: "checkmark.circle.fill")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    
                    // Features
                    Text("Dahil Olan Hizmetler")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(tour.features, id: \.self) { feature in
                            Label(feature, systemImage: "checkmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Contact Buttons
                    VStack(spacing: 12) {
                        // WhatsApp Button
                        Link(destination: URL(string: "https://wa.me/00905322446645")!) {
                            HStack {
                                Image("whatsapp")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("WhatsApp'tan Bilgi Al")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "b28f48"))
                            .cornerRadius(15)
                        }
                        
                        // Call Button
                        Link(destination: URL(string: "tel:08503052160")!) {
                            HStack {
                                Image(systemName: "phone.fill")
                                Text("Hemen Ara")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "b28f48"))
                            .cornerRadius(15)
                        }
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct HacToursView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HacToursView()
        }
    }
}
