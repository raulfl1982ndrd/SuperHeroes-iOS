//
//  DetailViewController.swift
//  SuperHeroes-iOS
//
//  Created by Mañanas on 5/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var realNameLabel: UILabel!
    
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    @IBOutlet weak var IntelligenceStat: UILabel!
    @IBOutlet weak var IntelligenceProgressView: UIProgressView!
   
    @IBOutlet weak var StrengthStat: UILabel!
    @IBOutlet weak var StrengthProgressView: UIProgressView!
    
    @IBOutlet weak var SpeedStat: UILabel!
    @IBOutlet weak var SpeedProgressView: UIProgressView!
    
    @IBOutlet weak var DurabilityStat: UILabel!
    @IBOutlet weak var DurabilityProgressView: UIProgressView!
    
    @IBOutlet weak var PowerStat: UILabel!
    @IBOutlet weak var PowerProgressView: UIProgressView!
    
    @IBOutlet weak var CombatStat: UILabel!
    @IBOutlet weak var CombatProgressView: UIProgressView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var superHero: SuperHero? = nil
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var stackView: UIView!
    @IBOutlet weak var stackViewPowerStats: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //scrollView.roundCorners(radius: 8)
        stackView.roundCorners(radius: 16)
        stackViewPowerStats.roundCorners(radius: 16)
        // Do any additional setup after loading the view.
        if let superHero = superHero{
            self.navigationItem.title = superHero.name
            avatarImageView.loadFrom(url: superHero.image.url)
            avatarImageView.roundCorners(radius: 8)
            imageView.roundCorners(radius: 16)
            realNameLabel.text = superHero.biography.realName

            publisherLabel.text = superHero.biography.publisher
            placeOfBirthLabel.text = superHero.biography.placeOfBirth
            alignmentLabel.text = superHero.biography.alignment.uppercased()
            if (superHero.biography.alignment == "good") {
                alignmentLabel.textColor = UIColor.systemGreen
            } else {
                alignmentLabel.textColor = UIColor.systemRed
            }
            
            IntelligenceStat.text = superHero.powerstats.intelligence
            IntelligenceProgressView.progress = ((Float(superHero.powerstats.intelligence) ?? 0.0) / 100.0)
            StrengthStat.text = superHero.powerstats.strength
            StrengthProgressView.progress = (Float(superHero.powerstats.strength) ?? 0.0) / 100.0
            SpeedStat.text = superHero.powerstats.speed
            SpeedProgressView.progress = (Float(superHero.powerstats.speed) ?? 0.0) / 100.0
            DurabilityStat.text = superHero.powerstats.durability
            DurabilityProgressView.progress = (Float(superHero.powerstats.durability) ?? 0.0) / 100.0
            PowerStat.text = superHero.powerstats.power
            PowerProgressView.progress = (Float(superHero.powerstats.power) ?? 0.0) / 100.0
            CombatStat.text = superHero.powerstats.combat
            CombatProgressView.progress = (Float(superHero.powerstats.combat) ?? 0.0) / 100.0
            // ...
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
