//
//  DataManager.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let stations = ["Сахалыы Виктория", "Тэтим Радио"]
    
    private init() {}
}

enum RadioStreamURL: String {
    case victoriyaFM = "http://37.139.33.202:8000/stream.mp3"
    case tetimFM = "https://icecast-saha.cdnvideo.ru/saha"
}
