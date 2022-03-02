//
//  RadioStation.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

import UIKit

enum RadioStreamURL: String {
    case victoriyaFM = "http://37.139.33.202:8000/stream.mp3"
    case tetimFM = "https://icecast-saha.cdnvideo.ru/saha"
}

struct Radio {
    let title: String
    let icon: UIImage
    let station: RadioStreamURL
}
