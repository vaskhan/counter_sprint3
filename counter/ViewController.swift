    //
    //  ViewController.swift
    //  counter
    //
    //  Created by Василий Ханин on 06.10.2024.
    //

    import UIKit

    class ViewController: UIViewController {
        @IBOutlet weak var counterField: UILabel!
        @IBOutlet weak var textView: UITextView!
        
        private var i: Int = 0
        
        @IBAction func minusButton(_ sender: Any) {
            if i == 0 {
                textView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: попытка уменьшить значение счётчика ниже 0\n"
            } else {
                i -= 1
                counterField.text = "Значение счётчика: " + String(i)
                textView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение изменено на -1\n"
            }
            scrollToBottom()
            
        }
        @IBAction func plusButton(_ sender: Any) {
            i += 1
            counterField.text = "Значение счётчика: " + String(i)
            textView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение изменено на +1\n"
            scrollToBottom()
        }
        
        @IBAction func resetButton(_ sender: Any) {
            i = 0
            counterField.text = "Значение счётчика: " + String(i)
            textView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение сброшено\n"
            scrollToBottom()
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            textView.layer.borderColor = UIColor.darkGray.cgColor
            textView.layer.borderWidth = 2.0
            
            counterField.layer.borderColor = UIColor.darkGray.cgColor
            counterField.layer.borderWidth = 2.0
            // Do any additional setup after loading the view.
        }

        func scrollToBottom() {
            let range = NSRange(location: textView.text.count - 1, length: 1)
            textView.scrollRangeToVisible(range)
        }
    }
    extension Date {
        func formatted(as format: String = "yyyy-MM-dd HH:mm:ss") -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: self)
        }
    }
