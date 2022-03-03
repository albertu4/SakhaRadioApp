//
//  CollectionViewController.swift
//  SakhaRadioApp
//
//  Created by Михаил Иванов on 03.03.2022.
//

import UIKit



private let reuseIdentifier = "radioStation"

class RadioCollectionViewController: UICollectionViewController {
    
    let radioStations = Radio.getRadioStation()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        radioStations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RadioStationCollectionViewCell
        
        let radioStation = radioStations[indexPath.row]
        cell.configure(radio: radioStation)
        
        return cell
    }
}

extension RadioCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
        
    }
}
