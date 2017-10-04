  //
//  SecondViewController.swift
//  musicplayer
//
//  Created by Kanchiraju on 9/4/17.
//  Copyright © 2017 kvnssss. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any) {
        if audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if thisSong == 1
        {
            playThis(thisOne: songs[thisSong-1])
        }
        else
        {
            
        }
       
    }
    
    @IBAction func next(_ sender: Any) {
        if thisSong < songs.count-1
        {
            playThis(thisOne: songs[thisSong + 1])
        }
        else
        {
            
        }
        
    }
    
    @IBAction func slider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".m4a")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            thisSong += 1
            audioPlayer.play()
        }
        catch
        {
                print ("ERROR")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

