//
//  RadioListViewController.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 04.03.2022.
//

import UIKit
import AVKit

class RadioListViewController: UIViewController {
    
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    private var radioList = Radio.getRadioStation()
    
    private let radioPlayer: AVPlayer = {
        let radioPlayer = AVPlayer()
        return radioPlayer
    }()
    
    private var lastRadioURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func playRadio(with url: String) {
        print(url, lastRadioURL)
        if url != lastRadioURL {
            radioPlayer.pause()
        }
        lastRadioURL = url
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
    
    @IBAction func changeVolume() {
        radioPlayer.volume = volumeSlider.value
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
        content.imageProperties.maximumSize = CGSize(width: 70, height: 70)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let radioURL = radioList[indexPath.row].station.rawValue
        playRadio(with: radioURL)
    }
    
//    //MARK: - Animations
//        private func enlargeRadioImage() {
//            UIView.animate(withDuration: 1,
//                           delay: 0,
//                           usingSpringWithDamping: 0.5,
//                           initialSpringVelocity: 1,
//                           options: .curveEaseInOut,
//                           animations: {
//                tableView. = .identity
//            }, completion: nil)
//        }
//
//        private func reduceRadioImage() {
//            UIView.animate(withDuration: 1,
//                           delay: 0,
//                           usingSpringWithDamping: 0.5,
//                           initialSpringVelocity: 1,
//                           options: .curveEaseInOut,
//                           animations: {
//                let scale: CGFloat = 0.8
//                self.radioIcon.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }, completion: nil)
//        }
//    }
}
