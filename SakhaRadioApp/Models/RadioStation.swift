//
//  RadioStation.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

struct Radio {
    let title: String
    let icon: String
    let station: RadioStreamURL
    
    static func getRadioStation() -> [Radio] {
        [
            Radio(title: DataManager.shared.stations[0],
                  icon: "victoriyaRadioIcon",
                  station: RadioStreamURL.victoriyaFM),
            
            Radio(title: DataManager.shared.stations[1],
                  icon: "tetimRadioIcon",
                  station: RadioStreamURL.tetimFM)
        ]
    }
}
