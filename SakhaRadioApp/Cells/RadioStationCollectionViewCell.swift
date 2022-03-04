////
////  RadioStationCollectionViewCell.swift
////  SakhaRadioApp
////
////  Created by Михаил Иванов on 03.03.2022.
////
//
//import UIKit
//import AVKit
//
//class RadioStationCollectionViewCell: UICollectionViewCell {
//    
//    @IBOutlet var radioTitle: UILabel!
//    @IBOutlet var radioIcon: UIImageView!
//    @IBOutlet var buttonPlay: UIButton!
//    
//    private let radioPlayer: AVPlayer = {
//        let avPlayer = AVPlayer()
//        return avPlayer
//    }()
//    
//    @IBAction func playRadio(_ sender: UIButton) {
//        playAndPauseRadio(sender: sender)
//    }
//    
//    func configure(radio: Radio) {
//        radioTitle.text = radio.title
//        radioIcon.image = UIImage(named: radio.icon)
//        radioIcon.layer.cornerRadius = 8
//        let scale: CGFloat = 0.8
//        radioIcon.transform = CGAffineTransform(scaleX: scale, y: scale)
//        playSound(from: radio.station.rawValue)
//    }
//    
//    private func playSound(from url: String) {
//        guard let streamURL = URL(string: url) else { return }
//        let radioItem = AVPlayerItem(url: streamURL)
//        radioPlayer.replaceCurrentItem(with: radioItem)
//    }
//
//    private func playAndPauseRadio(sender: UIButton) {
//        if radioPlayer.timeControlStatus == .paused {
//            radioPlayer.play()
//            enlargeRadioImage()
//            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
//        } else {
//            radioPlayer.pause()
//            reduceRadioImage()
//            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
//        }
//    }
//    
////    private func monitorStartTime() {
////        let time = CMTimeMake(value: 1, timescale: 3)
////        let times = [NSValue(time: time)]
////        radioPlayer.addBoundaryTimeObserver(forTimes: times, queue: .main) {
////            [weak self] in self?.enlargeRadioImage()
////        }
////    }
//    
//    //MARK: - Animations
//    private func enlargeRadioImage() {
//        UIView.animate(withDuration: 1,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 1,
//                       options: .curveEaseInOut,
//                       animations: {
//            self.radioIcon.transform = .identity
//        }, completion: nil)
//    }
//    
//    private func reduceRadioImage() {
//        UIView.animate(withDuration: 1,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 1,
//                       options: .curveEaseInOut,
//                       animations: {
//            let scale: CGFloat = 0.8
//            self.radioIcon.transform = CGAffineTransform(scaleX: scale, y: scale)
//        }, completion: nil)
//    }
//}
//
