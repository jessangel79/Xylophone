//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    // MARK: - Properties
    
    private var player: AVAudioPlayer?
    
    // MARK: - Actions

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let soundName = sender.currentTitle else { return }
        playSound(soundName: soundName)
        print(sender.currentTitle ?? "")
        // Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        // Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
//        print(sender.backgroundColor)
//        print(sender.titleLabel?.text)
//        print(sender.title(for: .normal))

    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methodes
    private func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

