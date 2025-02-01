import SwiftUI
import MapKit

struct ContactInfo: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let detail: String
    let action: (() -> Void)?
}

struct ContactView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var message = ""
    
    let contactInfo: [ContactInfo] = [
        ContactInfo(icon: "phone.fill",
                   title: "Telefon",
                   detail: "0850 305 2160",
                   action: { UIApplication.shared.open(URL(string: "tel:08503052160")!) }),
        ContactInfo(icon: "phone.fill",
                   title: "WhatsApp",
                   detail: "+90 532 244 66 45",
                   action: { UIApplication.shared.open(URL(string: "https://wa.me/00905322446645")!) }),
        ContactInfo(icon: "envelope.fill",
                   title: "E-posta",
                   detail: "info@ecmaintur.com",
                   action: { UIApplication.shared.open(URL(string: "mailto:info@ecmaintur.com")!) }),
        ContactInfo(icon: "mappin.circle.fill",
                   title: "Adres",
                   detail: "Altunizade Mah. Kuşbakışı Cad. No:7 Kat:3 Üsküdar/İstanbul",
                   action: nil)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Özel başlık tasarımı
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "b28f48").opacity(0.8), Color(hex: "b28f48")]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(height: 120)
                        
                        VStack {
                            Text("İletişim")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Sizden haber almaktan mutluluk duyarız")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                    }
                    
                    // İletişim bilgileri
                    VStack(spacing: 20) {
                        ForEach(contactInfo) { info in
                            Button(action: { info.action?() }) {
                                HStack(spacing: 15) {
                                    ZStack {
                                        Circle()
                                            .fill(Color(hex: "b28f48").opacity(0.1))
                                            .frame(width: 50, height: 50)
                                        
                                        Image(systemName: info.icon)
                                            .font(.system(size: 22))
                                            .foregroundColor(Color(hex: "b28f48"))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(info.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        
                                        Text(info.detail)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    if info.action != nil {
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color(hex: "b28f48"))
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.15), radius: 10, x: 0, y: 5)
                            }
                        }
                    }
                    .padding()
                    .offset(y: -30)
                    
                    // İletişim formu
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Bize Ulaşın")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Adınız")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                TextField("", text: $name)
                                    .textFieldStyle(ModernTextFieldStyle())
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("E-posta")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                TextField("", text: $email)
                                    .textFieldStyle(ModernTextFieldStyle())
                                    .keyboardType(.emailAddress)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Telefon")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                TextField("", text: $phone)
                                    .textFieldStyle(ModernTextFieldStyle())
                                    .keyboardType(.phonePad)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Mesajınız")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                TextEditor(text: $message)
                                    .frame(height: 120)
                                    .padding(8)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                            }
                            
                            Button(action: {
                                // Mesaj gönderme işlemi
                            }) {
                                Text("Mesaj Gönder")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color(hex: "b28f48").opacity(0.8), Color(hex: "b28f48")]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .cornerRadius(15)
                                    .shadow(color: Color(hex: "b28f48").opacity(0.3), radius: 10, x: 0, y: 5)
                            }
                        }
                        .padding(25)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.1), radius: 15, x: 0, y: 10)
                    }
                    .padding()
                    
                    // Harita
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Konumumuz")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Map(coordinateRegion: .constant(MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 41.0232, longitude: 29.0533),
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
                            interactionModes: [.pan, .zoom])
                        .frame(height: 250)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        .shadow(color: .gray.opacity(0.2), radius: 15, x: 0, y: 10)
                    }
                    .padding()
                    
                    // WhatsApp butonu
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://wa.me/00905322446645")!)
                    }) {
                        HStack(spacing: 12) {
                            Image("whatsapp")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("WhatsApp'tan Yazın")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "b28f48").opacity(0.8), Color(hex: "b28f48")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .shadow(color: Color(hex: "b28f48").opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .background(Color.gray.opacity(0.05))
        }
    }
}

struct ModernTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
