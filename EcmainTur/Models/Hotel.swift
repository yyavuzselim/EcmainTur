import Foundation

struct Hotel: Identifiable {
    let id = UUID()
    let name: String
    let location: String // Mekke veya Medine
    let stars: Int
    let distance: String
    let description: String
    let features: [String]
    let images: [String]
    let roomTypes: [RoomType]
}

struct RoomType {
    let name: String
    let capacity: String
    let amenities: [String]
    let price: String
}

// Örnek oteller
extension Hotel {
    static let sampleHotels = [
        Hotel(
            name: "LULU AL NOZHA",
            location: "Mekke",
            stars: 5,
            distance: "Harem'e 800 metre",
            description: "Mekke'nin merkezinde yer alan LULU AL NOZHA, modern tasarımı ve üstün hizmet kalitesiyle misafirlerine konforlu bir konaklama deneyimi sunuyor.",
            features: [
                "24 Saat Resepsiyon",
                "Ücretsiz Wi-Fi",
                "Restaurant",
                "Oda Servisi",
                "Toplantı Salonu",
                "İş Merkezi",
                "Çamaşırhane",
                "Vale Parking"
            ],
            images: ["lulu1", "lulu2", "lulu3"],
            roomTypes: [
                RoomType(
                    name: "Standart Oda",
                    capacity: "2-3 Kişilik",
                    amenities: ["LCD TV", "Minibar", "Kasa", "Klima"],
                    price: "Fiyat için arayınız"
                ),
                RoomType(
                    name: "Deluxe Oda",
                    capacity: "3-4 Kişilik",
                    amenities: ["LCD TV", "Minibar", "Kasa", "Klima", "Oturma Alanı"],
                    price: "Fiyat için arayınız"
                )
            ]
        ),
        Hotel(
            name: "SAFWA ORKİDE",
            location: "Mekke",
            stars: 4,
            distance: "Harem'e 400 metre",
            description: "SAFWA ORKİDE, Kabe'ye yakın konumu ve kaliteli hizmetiyle öne çıkan bir oteldir. Modern odaları ve profesyonel personeli ile misafirlerine rahat bir konaklama imkanı sunar.",
            features: [
                "24 Saat Resepsiyon",
                "Ücretsiz Wi-Fi",
                "Restaurant",
                "Oda Servisi",
                "Mescid",
                "Çamaşırhane"
            ],
            images: ["safwa1", "safwa2", "safwa3"],
            roomTypes: [
                RoomType(
                    name: "Standart Oda",
                    capacity: "2-3 Kişilik",
                    amenities: ["LCD TV", "Minibar", "Klima"],
                    price: "Fiyat için arayınız"
                )
            ]
        ),
        Hotel(
            name: "HAYAL GOLDEN",
            location: "Medine",
            stars: 4,
            distance: "Mescid-i Nebevi'ye 200 metre",
            description: "Medine'nin kalbinde yer alan HAYAL GOLDEN, Mescid-i Nebevi'ye yürüme mesafesinde konumu ve modern tesisleriyle misafirlerini ağırlıyor.",
            features: [
                "24 Saat Resepsiyon",
                "Ücretsiz Wi-Fi",
                "Restaurant",
                "Oda Servisi",
                "Mescid",
                "Toplantı Salonu",
                "Çamaşırhane"
            ],
            images: ["hayal1", "hayal2", "hayal3"],
            roomTypes: [
                RoomType(
                    name: "Standart Oda",
                    capacity: "2-3 Kişilik",
                    amenities: ["LCD TV", "Minibar", "Klima", "Kasa"],
                    price: "Fiyat için arayınız"
                ),
                RoomType(
                    name: "Aile Odası",
                    capacity: "4-5 Kişilik",
                    amenities: ["LCD TV", "Minibar", "Klima", "Kasa", "Oturma Alanı"],
                    price: "Fiyat için arayınız"
                )
            ]
        ),
        Hotel(
            name: "Movenpick Mekke",
            location: "Mekke",
            stars: 5,
            distance: "Harem'e 100 metre",
            description: "Movenpick Mekke, lüks konaklama imkanları ve üstün hizmet kalitesiyle öne çıkan, Kabe'ye en yakın 5 yıldızlı otellerden biridir.",
            features: [
                "24 Saat Resepsiyon",
                "Ücretsiz Yüksek Hızlı Wi-Fi",
                "Çoklu Restaurant Seçenekleri",
                "24 Saat Oda Servisi",
                "Executive Lounge",
                "Spa & Wellness",
                "İş Merkezi",
                "Concierge Hizmeti",
                "Vale Parking"
            ],
            images: ["movenpick1", "movenpick2", "movenpick3"],
            roomTypes: [
                RoomType(
                    name: "Deluxe Oda",
                    capacity: "2-3 Kişilik",
                    amenities: ["Smart TV", "Minibar", "Kasa", "Klima", "Çay/Kahve Seti"],
                    price: "Fiyat için arayınız"
                ),
                RoomType(
                    name: "Executive Suite",
                    capacity: "3-4 Kişilik",
                    amenities: ["Smart TV", "Minibar", "Kasa", "Klima", "Oturma Alanı", "Executive Lounge Erişimi"],
                    price: "Fiyat için arayınız"
                )
            ]
        )
    ]
}
