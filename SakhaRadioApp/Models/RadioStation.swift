//
//  RadioStation.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

struct Radio {
    let title: String
    let frequency: String
    let icon: String
    let station: RadioStreamURL
    let numberFolCall: Int
    let numberForSMS: Int
    
    static func getRadioStation() -> [Radio] {
        [
            Radio(title: DataManager.shared.stations[0],
                  frequency: "FM 104,5",
                  icon: "victoriyaRadio",
                  station: RadioStreamURL.victoriyaFM,
                 numberFolCall: +74112420224,
                 numberForSMS: +79142901860),
            
            Radio(title: DataManager.shared.stations[1],
                  frequency: "FM 107,1",
                  icon: "tetimRadio",
                  station: RadioStreamURL.tetimFM,
                  numberFolCall: +74112320066,
                  numberForSMS: +74112320066),
            
            Radio(title: DataManager.shared.stations[2],
                  frequency: "FM 105,3",
                  icon: "mayaDolguna",
                  station: RadioStreamURL.mayaDolguna,
                  numberFolCall: +79841031059,
                  numberForSMS: +79841031059),
            
            Radio(title: DataManager.shared.stations[3],
                  frequency: "FM 104,0",
                  icon: "dolgunRadio",
                  station: RadioStreamURL.dolgunRadio,
                  numberFolCall: +74113521100,
                  numberForSMS: +79148289040),
            
            Radio(title: DataManager.shared.stations[4],
                  frequency: "онлайн радио",
                  icon: "duoraanRadio",
                  station: RadioStreamURL.duoraanRadio,
                  numberFolCall: +79841131738,
                  numberForSMS: +79841131738),
            
            Radio(title: DataManager.shared.stations[5],
                  frequency: "онлайн радио",
                  icon: "algysRadio",
                  station: RadioStreamURL.algysRadio,
                  numberFolCall: +79142770223,
                  numberForSMS: +79142770223),
            
            Radio(title: DataManager.shared.stations[6],
                  frequency: "онлайн радио",
                  icon: "pokrovskRadio",
                  station: RadioStreamURL.pokrovskRadio,
                  numberFolCall: +79142982068,
                  numberForSMS: +79142982068)
        ]
    }
}
