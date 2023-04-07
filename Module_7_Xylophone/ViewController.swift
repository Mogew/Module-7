//
//  ViewController.swift
//  Module_7_Xylophone
//
//  Created by Renat on 04.04.2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func playSound(fileName: String, withExtansion: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: withExtansion) else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.3
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(fileName: (sender.titleLabel?.text)!, withExtansion: "wav")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
    }
}

