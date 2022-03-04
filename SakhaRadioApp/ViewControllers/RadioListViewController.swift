//
//  RadioListViewController.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 04.03.2022.
//

import UIKit
import AVKit

class RadioListViewController: UIViewController {
    
    private var radioList = Radio.getRadioStation()
    
    private let radioPlayer: AVPlayer = {
        let radioPlayer = AVPlayer()
        return radioPlayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func playRadio(with url: String) {
        guard let radioStream = URL(string: url) else { return }
        let radioItem = AVPlayerItem(url: radioStream)
        radioPlayer.replaceCurrentItem(with: radioItem)
        
        playAndPauseRadio()
    }
    
    private func playAndPauseRadio() {
        if radioPlayer.timeControlStatus == .paused {
            radioPlayer.play()
//            enlargeRadioImage()
//            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            radioPlayer.pause()
//            reduceRadioImage()
//            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
}

extension RadioListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        radioList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioStation", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let radioStation = radioList[indexPath.row]
        
        content.text = radioStation.title
        content.image = UIImage(named: radioStation.icon)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let radioURL = radioList[indexPath.row].station.rawValue
        playRadio(with: radioURL)
    }
    
    
    
}
