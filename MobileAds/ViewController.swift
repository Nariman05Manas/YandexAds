//
//  ViewController.swift
//  MobileAds
//
//  Created by qwerty on 21.11.2024.
//

import UIKit
import YandexMobileAds

class ViewController: UIViewController {
    
    private lazy var adView: AdView = {
        let width = view.safeAreaLayoutGuide.layoutFrame.width
        let adSize = BannerAdSize.stickySize(withContainerWidth: width)
        
        let adView = AdView(adUnitID: "demo-appopenad-yandex", adSize: adSize)
        adView.delegate = self
        adView.translatesAutoresizingMaskIntoConstraints = false
        return adView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adView.loadAd()
    }
    
    func showAd() {
          view.addSubview(adView)
          NSLayoutConstraint.activate([
            adView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
              adView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
      }
}

        extension ViewController: AdViewDelegate {
            func adViewDidLoad(_ adView: AdView) {
                showAd()
            }

            func adViewDidFailLoading(_ adView: AdView, error: Error) {
                // This method will call after getting any error while loading the ad
            
    }


}

