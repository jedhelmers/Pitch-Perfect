//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Helmers, Jesse L. on 11/17/19.
//  Copyright © 2019 Helmers, Jesse L. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var wordList: [String] {
        return components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty }
    }
    subscript (i: Int) -> Character {
      return self[index(startIndex, offsetBy: i)]
    }
}

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var squirrelButton: UIButton!
    @IBOutlet weak var darthButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL :URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
   
    
    enum Song: Int {
        case oneOne = 0,
        oneTwo,
        oneThree,
        oneFour,
        twoOne,
        twoTwo,
        twoThree,
        twoFour,
        threeOne,
        threeTwo,
        threeThree,
        threeFour,
        fourOne,
        fourTwo,
        fourThree,
        fourFour
    }
    
    enum ButtonType: Int {
        case slow = 0, fast, squirrel, darth, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        stopButton.isEnabled = true
        
        
        switch(ButtonType(rawValue: sender.tag)!){
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .squirrel:
                playSound(pitch: 1000)
            case .darth:
                playSound(rate: 0.9, pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
        }
    }

    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
    }

}
