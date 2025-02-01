import Foundation

struct HacTour: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let description: String
    let price: String
    let duration: String
    let startDate: Date
    let endDate: Date
    let mekkeHotel: HotelInfo
    let medineHotel: HotelInfo
    let features: [String]
    let images: [String]
    let packageType: String // Premium, Standart vb.
}

struct HotelInfo {
    let name: String
    let stars: Int
    let distance: String
    let features: [String]
}

// Örnek turlar
extension HacTour {
    static let sampleTours = [
        HacTour(
            title: "Premium Hac Programı",
            subtitle: "31 Mayıs - 13 Haziran 2025",
            description: "Lüks otellerde konaklama ve premium hizmetler ile unutulmaz bir hac deneyimi.",
            price: "69.500 SAR (18.550$)",
            duration: "13 Gün",
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 31))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 13))!,
            mekkeHotel: HotelInfo(
                name: "Safwa Towers",
                stars: 4,
                distance: "Harem'e 50 metre",
                features: [
                    "4. Burç",
                    "Harem'e yürüme mesafesinde",
                    "Premium hizmet",
                    "24 saat resepsiyon"
                ]
            ),
            medineHotel: HotelInfo(
                name: "Peninsula World Hotel",
                stars: 4,
                distance: "Merkezi Konum",
                features: [
                    "Merkezi lokasyon",
                    "Modern tesisler",
                    "Restoran",
                    "Ücretsiz Wi-Fi"
                ]
            ),
            features: [
                "VIP Transfer Hizmetleri",
                "Profesyonel Rehberlik",
                "Özel Sağlık Sigortası",
                "3 Öğün Açık Büfe Yemek",
                "Hac Eğitim Seminerleri",
                "Hediye Hac Seti"
            ],
            images: ["hac1", "hac2", "hac3"],
            packageType: "Premium"
        ),
        HacTour(
            title: "Standart Hac Programı",
            subtitle: "11 Mayıs - 13 Haziran 2025",
            description: "Ekonomik fiyatlarla kaliteli hac hizmeti. Servis imkanı ile kolay ulaşım.",
            price: "Fiyat için arayınız",
            duration: "33 Gün",
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 5, day: 11))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 6, day: 13))!,
            mekkeHotel: HotelInfo(
                name: "Blue Coral Hotel",
                stars: 3,
                distance: "Kabe'ye 3.5 km",
                features: [
                    "24 saat servis hizmeti",
                    "Restoran",
                    "Ücretsiz Wi-Fi",
                    "Klima"
                ]
            ),
            medineHotel: HotelInfo(
                name: "Merkezi Bölge Oteli",
                stars: 3,
                distance: "400 metre",
                features: [
                    "Merkezi konum",
                    "Mescid-i Nebevi'ye yakın",
                    "24 saat resepsiyon",
                    "Restoran"
                ]
            ),
            features: [
                "Servis Hizmetleri",
                "Rehberlik Hizmeti",
                "Sağlık Sigortası",
                "3 Öğün Yemek",
                "Hac Eğitim Seminerleri",
                "Hediye Hac Seti"
            ],
            images: ["hac4", "hac5", "hac6"],
            packageType: "Standart"
        )
    ]
}
