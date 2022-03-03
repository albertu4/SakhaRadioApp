//
//  RadioStationCollectionViewCell.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

import UIKit
import AVFoundation

class RadioStationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var radioTitle: UILabel!
    @IBOutlet var radioIcon: UIImageView!
    @IBOutlet var playButton: UIButton!
    
    var radioPlayer: AVPlayer?
    
    @IBAction func playRadio() {
        if radioPlayer?.timeControlStatus == .paused {
            radioPlayer?.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            radioPlayer?.pause()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    func configure(radio: Radio) {
        radioTitle.text = radio.title
        radioIcon.image = UIImage(named: radio.icon)
        playSound(from: radio.station.rawValue)
    }
    
    private func playSound(from url: String) {
        guard let streamURL = URL(string: url) else { return }
        let playerItem = AVPlayerItem.init(url: streamURL)
            radioPlayer = AVPlayer(playerItem: playerItem)
    }
    
//    private func changeStation(to url: String) {
//        radioPlayer?.replaceCurrentItem(with: <#T##AVPlayerItem?#>)
//    }
}

