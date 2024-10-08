
import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var changesTextView: UITextView!
    
    //MARK: - Private Properties
    private var count: Int = 0
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changesTextView.layer.borderColor = UIColor.darkGray.cgColor
        changesTextView.layer.borderWidth = 2.0
        
        counterLabel.layer.borderColor = UIColor.darkGray.cgColor
        counterLabel.layer.borderWidth = 2.0
    }
    
    // MARK: - IB Actions
    @IBAction private func minusButton(_ sender: Any) {
        if count == 0 {
            changesTextView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: попытка уменьшить значение счётчика ниже 0\n"
        } else {
            count -= 1
            counterLabel.text = "Значение счётчика: " + String(count)
            changesTextView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение изменено на -1\n"
        }
        scrollToBottom()
        
    }
    @IBAction private func plusButton(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: " + String(count)
        changesTextView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение изменено на +1\n"
        scrollToBottom()
    }
    
    @IBAction private func resetButton(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: " + String(count)
        changesTextView.text += "[\(Date().formatted(as: "yyyy-MM-dd HH:mm:ss"))]: значение сброшено\n"
        scrollToBottom()
    }
    
    // MARK: - Private Methods
    private func scrollToBottom() {
        let range = NSRange(location: changesTextView.text.count - 1, length: 1)
        changesTextView.scrollRangeToVisible(range)
    }
}
//MARK: - Extensions
extension Date {
    func formatted(as format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
