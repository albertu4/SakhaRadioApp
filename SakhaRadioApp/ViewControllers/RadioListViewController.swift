//
//  RadioListViewController.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 04.03.2022.
//

import UIKit
import AVKit

class RadioListViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var playerButtonLabel: UIButton!
    
    @IBOutlet weak var radioIcon: UIImageView!
    
    @IBOutlet weak var radioTitle: UILabel!
    
    //MARK: -Private properties
    private var radioList = Radio.getRadioStation()
    
    private var animationStarted = false
    
    private let radioPlayer: AVPlayer = {
        let radioPlayer = AVPlayer()
        return radioPlayer
    }()
    
    private var lastRadioURL = ""

    //MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        radioPlayer.volume = volumeSlider.value
        radioIcon.frame = CGRect(x: 2, y: 2, width: 2, height: 2)
        setupNavigationBar()
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
        guard let radioStream = URL(string: url) else { return }
        let radioItem = AVPlayerItem(url: radioStream)
        radioPlayer.replaceCurrentItem(with: radioItem)
        
        playAndPauseRadio()
        playerButtonLabel.isEnabled = true
    }
    
    private func playAndPauseRadio() {
        if radioPlayer.timeControlStatus == .paused {
            radioPlayer.play()
            reduceRadioImage()
            playerButtonLabel.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        } else {
            radioPlayer.pause()
            enlargeRadioImage()
            playerButtonLabel.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .systemPink
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

//MARK: - Extensions
extension RadioListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        radioList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioStation", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let radioStation = radioList[indexPath.row]
        
        content.text = radioStation.title
        content.textProperties.alignment = .center
        content.textProperties.font = .systemFont(ofSize: 18, weight: .medium)
        
        content.image = UIImage(named: radioStation.icon)
        content.imageProperties.reservedLayoutSize = CGSize(width: 60, height: 60)
        content.directionalLayoutMargins.leading = 25
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let radioURL = radioList[indexPath.row].station.rawValue
        radioIcon.image = UIImage(named: radioList[indexPath.row].icon)
        radioTitle.text = radioList[indexPath.row].title
        playRadio(with: radioURL)
    }
    
    //MARK: - Animations
        private func enlargeRadioImage() {
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                self.playerButtonLabel.transform = .identity
            }, completion: nil)
        }

        private func reduceRadioImage() {
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
    
}
