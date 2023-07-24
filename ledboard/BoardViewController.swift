//
//  BoardViewController.swift
//  ledboard
//
//  Created by 장혜성 on 2023/07/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet var sendTextField: UITextField!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var searchContainer: UIView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSearchContainer()
        designResultLabel()
        designFirstButton()
        designSecondButton()
        setSendTextField()
    }
    
    @IBAction func sendTextFieldReturnClicked(_ sender: UITextField) {
        sendAction()
    }
    
    @IBAction func tabGestureTabbed(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        print("보내기")
        sendAction()
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        print("색깔")
        resultLabel.textColor = getRandomColor()
        secondButton.tintColor = getRandomColor()
    }
    
    func setSendTextField() {
        sendTextField.returnKeyType = .send
        sendTextField.backgroundColor = .white
        sendTextField.textColor = .black
    }
    
    func designSearchContainer() {
        searchContainer.layer.cornerRadius = 8
        searchContainer.backgroundColor = .white
    }
    
    func designResultLabel() {
        resultLabel.font = .boldSystemFont(ofSize: 30)
        resultLabel.textAlignment = .center
        resultLabel.textColor = .white
    }
    
    func designFirstButton() {
        firstButton.layer.cornerRadius = 8
        firstButton.layer.borderColor = UIColor.black.cgColor
        firstButton.layer.borderWidth = 1
        firstButton.clipsToBounds = true
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 14)
        
        // UIEdgeInsets iOS 15 deprecated 대응
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("보내기", attributes: titleContainer)
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 15, bottom: 4, trailing: 15)
        firstButton.configuration = config
    }
    
    func designSecondButton() {
        secondButton.titleLabel?.font = .systemFont(ofSize: 14)
        secondButton.setTitle("Aa", for: .normal)
        secondButton.setTitle("Aa", for: .highlighted)
        secondButton.tintColor = .red
        secondButton.layer.cornerRadius = 8
        secondButton.layer.borderColor = UIColor.black.cgColor
        secondButton.layer.borderWidth = 1
        secondButton.backgroundColor = .white
        secondButton.clipsToBounds = true
        secondButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
    }
    
    func sendAction() {
        guard let sendTextFieldCnt = sendTextField.text?.count else {
            print("오류")
            return
        }
        
        if sendTextFieldCnt > 0 {
            resultLabel.text = sendTextField.text
            view.endEditing(true)
            sendTextField.text = ""
        } else {
            showAlert(title: "메시지", msg: "메시지를 입력해주세요")
        }
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 50..<255)
        let green = CGFloat.random(in: 50..<255)
        let blue = CGFloat.random(in: 50..<255)
        return UIColor(red:red/255.0, green:green/255.0, blue:blue/255.0, alpha:1.0)
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        //        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        //        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
