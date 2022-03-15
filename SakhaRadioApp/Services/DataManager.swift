//
//  DataManager.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let stations = ["Сахалыы Виктория", "Тэтим Радио", "Европа Плюс Якутск", "Долгун Радио (Сунтаар)", "Майа Долгуна", "Алгыс Радио (Бүлүү)", "Дуораан Радио (Уус-Алдан)"]
    
    private init() {}
}

enum RadioStreamURL: String {
    case victoriyaFM = "http://37.139.33.202:8000/stream.mp3"
    case tetimFM = "https://icecast-saha.cdnvideo.ru/saha"
    case europaPlus = "https://ep256.hostingradio.ru:8052/europaplus256.mp3"
    case dolgunRadio = "http://www.sitc.pro:8000/dolgun"
    case mayaDolguna = "https://c24.radioboss.fm:18216/stream"
    case algysRadio = "https://c22.radioboss.fm:18213/stream"
    case duoraanRadio = "https://c24.radioboss.fm:18244/stream"
}
