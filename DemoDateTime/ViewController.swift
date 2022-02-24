//
//  ViewController.swift
//  DemoDateTime
//
//  Created by TungDang on 5/20/20.
//  Copyright © 2020 Tung Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var defaultDate: UILabel!
    @IBOutlet weak var dateCalendar: UILabel!
    @IBOutlet weak var timeCalendar: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.defaultDate.text = Date().description(with: .none) //.autoupdatingCurrent ->tự động lấy ngày theo locale
//        self.dateCalendar.text = self.dateTextFormatter(format: "dd/MM/YYYY HH:mm:ss")
//        self.timeCalendar.text = self.timeTextFormatter(format: "HH:mm:ss")
//        let _: Timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            self.defaultDate.text = Date().description(with: .none) //.autoupdatingCurrent ->tự động lấy ngày theo locale
//            self.dateCalendar.text = self.dateTextFormatter(format: "dd/MM/YYYY HH:mm:ss")
//            self.timeCalendar.text = self.timeTextFormatter(format: "HH:mm:ss")
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.defaultDate.text = Date().description(with: .none) //.autoupdatingCurrent ->tự động lấy ngày theo locale
//            self.dateCalendar.text = self.dateTextFormatter(format: "dd/MM/YYYY HH:mm:ss")
//            self.timeCalendar.text = self.timeTextFormatter(format: "HH:mm:ss")
//        }
        
        //Create my CADisplayLink here
        let displayLink = CADisplayLink(target: self, selector: #selector(updateTime))
//        displayLink.add(to: .main, forMode: .default)
        displayLink.add(to: .current, forMode: .default)
    }
    
    @objc
    func updateTime(){
        self.defaultDate.text = Date().description(with: .none) //.autoupdatingCurrent ->tự động lấy ngày theo locale
        self.dateCalendar.text = self.dateTextFormatter(format: "dd/MM/YYYY HH:mm:ss")
        self.timeCalendar.text = self.timeTextFormatter(format: "HH:mm:ss")
    }
    
    func dateTextFormatter(format: String) -> String {
//        let formatter = DateComponentsFormatter() //Chuyển đổi lượng thời gian
        let dateFormatter = DateFormatter() //Chuyển đổi ngày
        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = format
        
        let today = Date() //Default date theo timezone gốc +000
        return dateFormatter.string(from: today) //
    }
    
    func timeTextFormatter(format: String) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = .autoupdatingCurrent
        timeFormatter.timeStyle = .full
        timeFormatter.dateFormat = format
        
        let today = Date() //Default date theo timezone gốc +000
        return timeFormatter.string(from: today)
    }
    
}

