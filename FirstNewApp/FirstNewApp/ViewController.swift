//
//  ViewController.swift
//  FirstNewApp
//
//  Created by MacBook Pro on 2022/10/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        

    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value 값을 가지고 메인레이블의 텍스트를 셋팅
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            
            if number > 0 {

                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
                
            } else {
                
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                
            }
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()

        
    }
}

