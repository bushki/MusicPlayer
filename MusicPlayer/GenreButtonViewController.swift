//
//  GenreButtonViewController.swift
//  MusicPlayer
//
//  Created by Melgar, Luis P. on 6/25/19.
//  Copyright © 2019 Bushki. All rights reserved.
//

import UIKit
import AudioToolbox
import MediaPlayer

class GenreButtonViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                 self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //vibration test
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }
}
