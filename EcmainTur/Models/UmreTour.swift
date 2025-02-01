import Foundation

struct UmreTour: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let description: String
    let price: String
    let duration: String
    let packageType: String
    let startDate: Date
    let endDate: Date
    let hotelType: String
    let features: [String]
    let images: [String]
    let location: String
    let hotelFeatures: [String]
}

// Örnek turlar
extension UmreTour {
    static let sampleTours = [
        UmreTour(
            title: "Kudüs Dahil Umre",
            subtitle: "Şubat 2024",
            description: "Kudüs ziyareti dahil özel umre programı. Mescid-i Aksa ziyareti ve 5 yıldızlı otellerde konaklama.",
            price: "4.500$",
            duration: "14 Gün",
            packageType: "Premium",
            startDate: Date(),
            endDate: Date().addingTimeInterval(14*24*60*60),
            hotelType: "5 Yıldızlı",
            features: [
                "Kudüs Ziyareti",
                "VIP Transfer",
                "Rehberlik Hizmeti",
                "Açık Büfe Yemek",
                "Sağlık Sigortası",
                "Seyahat Sigortası"
            ],
            images: ["umre1", "umre2", "umre3"],
            location: "Mekke & Medine & Kudüs",
            hotelFeatures: [
                "Merkezi Lokasyon",
                "Spa & Wellness",
                "24 Saat Resepsiyon",
                "Ücretsiz Wi-Fi"
            ]
        ),
        UmreTour(
            title: "Ramazan Umresi",
            subtitle: "Mart 2024",
            description: "Ramazan ayının bereketini yaşayacağınız özel umre programı. Mekke ve Medine'de 4 yıldızlı otellerde konaklama.",
            price: "3.500$",
            duration: "21 Gün",
            packageType: "Standart",
            startDate: Date(),
            endDate: Date().addingTimeInterval(21*24*60*60),
            hotelType: "4 Yıldızlı",
            features: [
                "Ramazan Özel Program",
                "Transfer Hizmeti",
                "Rehberlik Hizmeti",
                "3 Öğün Yemek",
                "Sağlık Sigortası"
            ],
            images: ["umre4", "umre5", "umre6"],
            location: "Mekke & Medine",
            hotelFeatures: [
                "Merkezi Konum",
                "Restaurant",
                "24 Saat Resepsiyon",
                "Ücretsiz Wi-Fi"
            ]
        ),
        UmreTour(
            title: "Lüks Umre Paketi",
            subtitle: "Nisan 2024",
            description: "En lüks otellerde konaklama ve VIP hizmetler ile unutulmaz bir umre deneyimi.",
            price: "5.500$",
            duration: "10 Gün",
            packageType: "VIP",
            startDate: Date(),
            endDate: Date().addingTimeInterval(10*24*60*60),
            hotelType: "5 Yıldızlı",
            features: [
                "VIP Transfer",
                "Özel Rehberlik",
                "Lüks Konaklama",
                "Açık Büfe Yemek",
                "Premium Sigorta"
            ],
            images: ["umre7", "umre8", "umre9"],
            location: "Mekke & Medine",
            hotelFeatures: [
                "Harem'e Yakın",
                "Spa & Wellness",
                "Executive Lounge",
                "24/7 Oda Servisi"
            ]
        ),
        UmreTour(
            title: "Ekonomik Umre",
            subtitle: "Mayıs 2024",
            description: "Uygun fiyata kaliteli umre deneyimi. 3 yıldızlı otellerde konaklama ve temel hizmetler.",
            price: "2.500$",
            duration: "14 Gün",
            packageType: "Ekonomik",
            startDate: Date(),
            endDate: Date().addingTimeInterval(14*24*60*60),
            hotelType: "3 Yıldızlı",
            features: [
                "Transfer Hizmeti",
                "Rehberlik",
                "3 Öğün Yemek",
                "Temel Sigorta"
            ],
            images: ["umre10", "umre11", "umre12"],
            location: "Mekke & Medine",
            hotelFeatures: [
                "Temiz Tesis",
                "Restaurant",
                "Wi-Fi",
                "24 Saat Resepsiyon"
            ]
        )
    ]
}
