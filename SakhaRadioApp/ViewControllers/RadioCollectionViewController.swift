////
////  CollectionViewController.swift
////  SakhaRadioApp
////
////  Created by Михаил Иванов on 03.03.2022.
////
//
//import UIKit
//import AVKit
//
//class RadioCollectionViewController: UICollectionViewController {
//    
//    private let radioStations = Radio.getRadioStation()
//
//    // MARK: UICollectionViewDataSource
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        radioStations.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "radioStation", for: indexPath) as! RadioStationCollectionViewCell
//        
//        let radioStation = radioStations[indexPath.row]
//        cell.configure(radio: radioStation)
//        
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let radioStation = radioStations[indexPath.row]
//        performSegue(withIdentifier: "showRadioPlayer", sender: radioStation)
//    }
//}
//
////MARK: - extension
//extension RadioCollectionViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width - 40, height: 130)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 20, left: 0, bottom: 40, right: 0)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        5
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let radioPlayerVC = segue.destination as? RadioPlayerViewController else { return }
//        radioPlayerVC.radioPlayer = sender as? Radio
//    }
//}
