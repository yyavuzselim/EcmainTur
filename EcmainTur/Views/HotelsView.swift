import SwiftUI

struct HotelsView: View {
    let hotels = Hotel.sampleHotels
    @State private var selectedLocation: String = "Tümü"
    let locations = ["Tümü", "Mekke", "Medine"]
    
    var filteredHotels: [Hotel] {
        if selectedLocation == "Tümü" {
            return hotels
        }
        return hotels.filter { $0.location == selectedLocation }
    }
    
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
                        Text("Otellerimiz")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Mekke ve Medine'nin en iyi otelleri")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                
                // Lokasyon Filtresi
                Picker("Lokasyon", selection: $selectedLocation) {
                    ForEach(locations, id: \.self) { location in
                        Text(location).tag(location)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Oteller
                VStack(spacing: 20) {
                    ForEach(filteredHotels) { hotel in
                        NavigationLink {
                            HotelDetailView(hotel: hotel)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            HotelCard(hotel: hotel)
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

struct HotelCard: View {
    let hotel: Hotel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Hotel Image
            ZStack(alignment: .bottomLeading) {
                Image(hotel.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(15)
                
                // Location and Stars
                VStack(alignment: .leading, spacing: 8) {
                    Text(hotel.location)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "b28f48").opacity(0.9))
                        .cornerRadius(6)
                    
                    HStack {
                        ForEach(0..<hotel.stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(6)
                }
                .padding(12)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(hotel.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(hotel.distance)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Features
                HStack(spacing: 15) {
                    ForEach(hotel.features.prefix(3), id: \.self) { feature in
                        Label(feature, systemImage: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
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

struct HotelDetailView: View {
    let hotel: Hotel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image Carousel
                TabView {
                    ForEach(hotel.images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle())
                
                VStack(alignment: .leading, spacing: 20) {
                    // Title and Location
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(hotel.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(hotel.location)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(hex: "b28f48").opacity(0.9))
                                .cornerRadius(6)
                        }
                        
                        HStack {
                            ForEach(0..<hotel.stars, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        
                        Text(hotel.distance)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Description
                    Text("Otel Hakkında")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(hotel.description)
                        .foregroundColor(.gray)
                    
                    // Features
                    Text("Otel Özellikleri")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 15) {
                        ForEach(hotel.features, id: \.self) { feature in
                            Label(feature, systemImage: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundColor(Color(hex: "b28f48"))
                        }
                    }
                    
                    // Room Types
                    Text("Oda Tipleri")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(hotel.roomTypes, id: \.name) { room in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(room.name)
                                .font(.headline)
                            
                            Text("Kapasite: \(room.capacity)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(room.amenities, id: \.self) { amenity in
                                    Label(amenity, systemImage: "checkmark.circle.fill")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Text(room.price)
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
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
                            .background(Color.green)
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
                            .background(Color.blue)
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

struct HotelsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HotelsView()
        }
    }
}
