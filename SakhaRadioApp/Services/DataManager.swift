//
//  DataManager.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let stations = ["Сахалыы Виктория",
                    "Тэтим Радио",
                    "Майа Долгуна",
                    "Долгун Радио (Сунтаар)",
                    "Дуораан Радио (Уус-Алдан)",
                    "Алгыс Радио (Бүлүү)",
                    "Радио Покровск"]
    
    private init() {}
}

enum RadioStreamURL: String {
    case victoriyaFM = "http://37.139.33.202:8000/stream.mp3"
    case tetimFM = "https://icecast-saha.cdnvideo.ru/saha"
    case mayaDolguna = "https://c24.radioboss.fm:18216/stream"
    case dolgunRadio = "http://www.sitc.pro:8000/dolgun"
    case duoraanRadio = "https://c24.radioboss.fm:18244/stream"
    case algysRadio = "https://c22.radioboss.fm:18213/stream"
    case pokrovskRadio = "https://c32.radioboss.fm:18505/stream"
}
