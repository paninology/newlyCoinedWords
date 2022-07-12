//
//  ViewController.swift
//  newlyCoinedWords
//
//  Created by yongseok lee on 2022/07/09.
//

import UIKit

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        print("dddd")
//        return true
//    }
//}

enum NewWord: String {
    case word0 = "삼귀자"
    case word1 = "꾸안꾸"
    case word2 = "캡이다"
    case word3 = "방가방가"
    case word4 = "헐"
    case word5 = "버카충"
    
    
}

class ViewController: UIViewController {
    
    let newWords = [NewWord.word0.rawValue: "연애를 시작하기 전 썸 상태 ❤︎", NewWord.word1.rawValue: "꾸준히 안하면 꾸물거리게 된다.", "캡이다": "엄청 대단하다~~", "방가방가": "매우 반갑다는 말", "헐": " 매우 놀란 기분을 표현하는 말", "버카충": "버스카드 충전의 약어"]

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var hashTag1: UIButton!
    @IBOutlet weak var hashTag2: UIButton!
    @IBOutlet weak var hashTag3: UIButton!
    @IBOutlet weak var hashTag4: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() { //hash3,4는 stroke로 테두리 그려봄.이후 버튼 통일시킬것
        super.viewDidLoad()
        hashTagSuggest()
        
        searchTextField.layer.borderWidth = 2
        buttonAppearanceSetting(hashTag1, cornerRadius: 8, borderWidth: 1.5)
        buttonAppearanceSetting(hashTag2, cornerRadius: 8, borderWidth: 1.3)
        buttonAppearanceSetting(hashTag3, cornerRadius: 8, borderWidth: 1.1)
        buttonAppearanceSetting(hashTag4, cornerRadius: 8, borderWidth: 1)
    }


    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchAction()
    }

    @IBAction func searchTextFieldAction(_ sender: UITextField) {
        resignFirstResponder()
        searchAction()
        
    }
    
    func searchAction() {
        guard let searchText = searchTextField.text else { return }
        if newWords.keys.contains(searchText) {
            resultLabel.text = newWords[searchText]
        } else {
            resultLabel.text = "찾으시는 단어가 없습니다."
        }
        hashTagSuggest()
    }
    
    func buttonAppearanceSetting(_ button: UIButton, cornerRadius: Double, borderWidth: Double) {
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = .white
        button.layer.borderWidth = borderWidth
        button.tintColor = .black
        
    }
    
    
    
    func hashTagSuggest() { //연습삼아 했음..지울것
  
        hashTag1.setTitle(NewWord.word1.rawValue, for: .normal)
        hashTag2.setTitle(NewWord.word2.rawValue, for: .normal)
        hashTag3.setTitle(NewWord.word3.rawValue, for: .normal)
        hashTag4.setTitle(NewWord.word4.rawValue, for: .normal)
    }
    
}

