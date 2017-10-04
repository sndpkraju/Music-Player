//
//  FirstViewController.swift
//  musicplayer
//
//  Created by Kanchiraju on 9/4/17.
//  Copyright © 2017 kvnssss. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: "m4a")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
        }
        catch
        {
            print("ERROR")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gettingSongName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func gettingSongName()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".m4a")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".m4a", with: "")
                    songs.append(mySong)
                }
            }
            
            myTableView.reloadData()
            
        }
        catch
        {
            
        }
    }
    
    
    
    
    
    

}

