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
    
    var radioPlayer: AVPlayer!
    
    @IBAction func playRadio() {
        radioPlayer.pause()
        if radioPlayer.isExternalPlaybackActive {
            radioPlayer.pause()
            playButton.titleLabel?.text = "▶️"
        } else {
            radioPlayer.play()
            playButton.titleLabel?.text = "⏸"
        }
    }
    
    func configure(radio: Radio) {
        radioTitle.text = radio.title
        radioIcon.image = UIImage(named: radio.icon)
        playSound(from: radio.station.rawValue)
    }
    
    private func playSound(from url: String) {
        let streamURL = URL(string: url)
        radioPlayer = AVPlayer(url: streamURL!)
    }
}

