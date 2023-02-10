//
//  TimerVC.swift
//  Lesson 11 UITabBarController - alarm clock + timer
//
//  Created by Валентин Ремизов on 07.02.2023.
//

import UIKit

class TimerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet private weak var timerPickerView: UIPickerView!
    @IBOutlet private weak var endSoundView: UIView!

    private var hour:Int = 0
    private var minutes:Int = 0
    private var seconds:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        timerPickerView.delegate = self
        timerPickerView.dataSource = self
        //Это закругляем края
        endSoundView.layer.cornerRadius = 15
    }
}

extension TimerVC {
    //Указываем количество столбцов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //Указываем в каком столбце сколько строк будет
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60

        default:
            return 0
        }
    }
    //Прописывает ширина столбцов, общая ширина экрана делится на 3
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            if row == 0 {return "\(row) Hour"} else {return "\(row)"}
        case 1:
            if row == 0 {return "\(row) Minute"} else {return "\(row)"}
        case 2:
            if row == 0 {return "\(row) Second"} else {return "\(row)"}
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
    }
}
