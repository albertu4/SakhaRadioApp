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
                  station: RadioStreamURL.tetimFM),
            
            Radio(title: DataManager.shared.stations[2],
                  icon: "europaPlus",
                  station: RadioStreamURL.europaPlus),
            
            Radio(title: DataManager.shared.stations[3],
                  icon: "dolgunRadio",
                  station: RadioStreamURL.dolgunRadio),
            
            Radio(title: DataManager.shared.stations[4],
                  icon: "mayaDolguna",
                  station: RadioStreamURL.mayaDolguna),
            
            Radio(title: DataManager.shared.stations[5],
                  icon: "algysRadio",
                  station: RadioStreamURL.algysRadio),
            
            Radio(title: DataManager.shared.stations[6],
                  icon: "duoraanRadio",
                  station: RadioStreamURL.duoraanRadio)
        ]
    }
}
