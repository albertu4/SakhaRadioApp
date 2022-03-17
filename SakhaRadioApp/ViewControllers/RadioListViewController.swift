//
//  RadioListViewController.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 04.03.2022.
//

import UIKit
import AVKit
import MediaPlayer

class RadioListViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var playerButtonLabel: UIButton!
    @IBOutlet weak var radioIcon: UIImageView!
    @IBOutlet weak var radioTitle: UILabel!
    
    //MARK: -Private properties
    private var radioList = Radio.getRadioStation()
    
    let radioPlayer: AVPlayer = {
        let radioPlayer = AVPlayer()
        return radioPlayer
    }()
    
    private var lastRadioURL = ""
    
    //MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        radioPlayer.volume = volumeSlider.value
        radioIcon.layer.cornerRadius = 10
        setupNavigationBar()
        
        setupNotifications()
        setupRemoteAudioControls()
    }
    
    //MARK: - IBActions
    @IBAction func changeVolume() {
        radioPlayer.volume = volumeSlider.value
    }
    
    @IBAction func playAndPauseRadioButton() {
        playAndPauseRadio()
    }
    
    //MARK: - private methods
    private func playRadio(with url: String) {
        if url != lastRadioURL {
            radioPlayer.pause()
        }
        lastRadioURL = url
        guard let radioStream = URL(string: lastRadioURL) else { return }
        let radioItem = AVPlayerItem(url: radioStream)
        radioPlayer.replaceCurrentItem(with: radioItem)
        setActiveAudioSession()
        
        playAndPauseRadio()
        playerButtonLabel.isEnabled = true
    }
    
    private func playAndPauseRadio() {
        if radioPlayer.timeControlStatus == .paused {
            radioPlayer.play()
            reduceRadioPlayerButton()
            playerButtonLabel.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        } else {
            radioPlayer.pause()
            enlargeRadioPlayerButton()
            playerButtonLabel.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "mainColor")
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setActiveAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("AudioSessions doesn't activated")
        }
    }
}

//MARK: - Extensions
extension RadioListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        radioList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 80
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioStation", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let radioStation = radioList[indexPath.row]
        
        content.text = radioStation.title
        content.secondaryText = radioStation.frequency
        content.textProperties.alignment = .center
        content.secondaryTextProperties.alignment = .center
        content.textProperties.font = .systemFont(ofSize: 18, weight: .medium)
        
        content.image = UIImage(named: radioStation.icon)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.directionalLayoutMargins.leading = 25
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let radioURL = radioList[indexPath.row].station.rawValue
        if radioTitle.text != radioList[indexPath.row].title {
            setPlayerData(index: indexPath.row)
        }
        playRadio(with: radioURL)
        
        setupNowPlaying(station: radioList[indexPath.row].title,
                        image: radioList[indexPath.row].icon)
    }
    
    //MARK: - SwipeActions
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let call = callRadioStation(at: indexPath)
        let message = sendMessage(at: indexPath)
        return UISwipeActionsConfiguration(actions: [call, message])
        
    }
    
    private func callRadioStation(at indexPath: IndexPath) -> UIContextualAction {
        let radioStation = radioList[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: "Call") {
            (action, view, completion) in
            guard let url = URL(string: "telprompt://\(radioStation.numberFolCall)"),
                  UIApplication.shared.canOpenURL(url) else { return }
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "phone.fill")
        return action
    }
    
    private func sendMessage(at indexPath: IndexPath) -> UIContextualAction {
        let radioStation = radioList[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Send Message") { (action, view, completion) in
            guard let url = URL(string: "sms://\(radioStation.numberForSMS)"),
                  UIApplication.shared.canOpenURL(url) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            completion(true)
        }
        action.backgroundColor = .systemYellow
        action.image = UIImage(systemName: "message.fill")
        return action
    }
    
    //MARK: - Animations
    private func enlargeRadioPlayerButton() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
            self.playerButtonLabel.transform = .identity
        }, completion: nil)
    }
    
    private func reduceRadioPlayerButton() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
            let scale: CGFloat = 0.8
            self.playerButtonLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }
    
    private func showPlayerTitleAndIcon() {
        UIView.animate(withDuration: 2,
                       delay: 0.3,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
            self.radioIcon.alpha = 1
            self.radioTitle.alpha = 1
        }, completion: nil)
    }
    
    private func setPlayerData(index: Int) {
        radioIcon.image = UIImage(named: radioList[index].icon)
        radioTitle.text = radioList[index].title
        radioIcon.alpha = 0
        radioTitle.alpha = 0
        showPlayerTitleAndIcon()
    }
    
    // MARK: - Resume playing after interruption
    private func setupNotifications() {
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(handleInterruption),
                       name: AVAudioSession.interruptionNotification,
                       object: AVAudioSession.sharedInstance())
    }
    
    @objc func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue)
        else { return }
        
        switch type {
        case .began:
            print(type)
            
        default:
            guard let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else { return }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                radioPlayer.play()
            } else {
                radioPlayer.pause()
            }
        }
    }
    
    // MARK: - Remote Control
    private func setupRemoteAudioControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.radioPlayer.rate == 0.0 {
                self.radioPlayer.play()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.radioPlayer.rate == 1.0 {
                self.radioPlayer.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
    private func setupNowPlaying(station: String, image: String) {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyAlbumTitle] = station
        
        if let image = UIImage(named: image) {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
                return image
            }
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyIsLiveStream] = true
        
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    //    func updateNowPlaying(isPause: Bool) {
    //            // Define Now Playing Info
    //            let nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo!
    //
    //            //nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime
    //            //nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = isPause ? 0 : 1
    //
    //            // Set the metadata
    //            MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    //        }
}
