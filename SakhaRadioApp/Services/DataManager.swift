//
//  DataManager.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let stations = ["Сахалыы Виктория", "Тэтим Радио", "Радио NRJ"]
    
    private init() {}
}

enum RadioStreamURL: String {
    case victoriyaFM = "http://37.139.33.202:8000/stream.mp3"
    case tetimFM = "https://icecast-saha.cdnvideo.ru/saha"
    case radioNRJ = "https://pub0202.101.ru:8443/stream/air/aac/64/99?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJrZXkiOiI5ZmFiMmY1ODg1OTE5ZTBkNGJlMDQwODY5ZjhiM2NkMiIsIklQIjoiMTg4LjI0NC4xMzcuMjQ5IiwiVUEiOiJNb3ppbGxhXC81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTBfMTVfNykgQXBwbGVXZWJLaXRcLzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZVwvOTguMC40NzU4LjEwOSBTYWZhcmlcLzUzNy4zNiIsInVpZF9jaGFubmVsIjoiOTkiLCJ0eXBlX2NoYW5uZWwiOiJjaGFubmVsIiwidHlwZURldmljZSI6IlBDIiwiQnJvd3NlciI6IkNocm9tZSIsIkJyb3dzZXJWZXJzaW9uIjoiOTguMC40NzU4LjEwOSIsIlN5c3RlbSI6Ik1hYyBPUyBYIFB1bWEiLCJleHAiOjE2NDYzNzg2Mjl9.t86iL6OcxO6MYLz-_KhNFuQ8yH1tjEp08_Qfjmvc8fQ"
}
