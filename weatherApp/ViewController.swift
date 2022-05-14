//
//  ViewController.swift
//  weatherApp
//
//  Created by sher on 12/5/22.
//

import UIKit
import SnapKit
class ViewController: UIViewController, UITextFieldDelegate {
    let headerBox = UIView()
    let background = UIImageView()
    let searchField: UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        text.font = UIFont(name: "AvenirNext-bold", size: 18)
        text.backgroundColor = UIColor(named: "search")
        text.textColor = UIColor.white
        text.attributedPlaceholder = NSAttributedString(string: "Навзвание города",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        text.placeholder = "Навзвание города"
        text.returnKeyType = .done
        text.clearButtonMode = .whileEditing
        text.keyboardType = UIKeyboardType.default
        return text
    }()
    let pogodaImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "h")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleLables: UITextView =  {
        let title = UITextView()
        title.text = "Osh"
        title.font = UIFont(name: "AvenirNext-Bold", size: 34)
        title.textColor = .white
        title.contentMode = .center
        title.backgroundColor = .clear
        return title
    }()
    var gradus: UITextView =  {
        let title = UITextView()
        title.text = "19˚"
        title.font = UIFont(name: "AvenirNext-Bold", size: 56)
        title.textColor = .white
        title.contentMode = .center
        title.backgroundColor = .clear
        return title
    }()
    var detail: UITextView =  {
        let title = UITextView()
        title.text = "Mostly Clear"
        title.font = UIFont(name: "AvenirNext-Bold", size: 24)
        title.textColor = .gray
        title.contentMode = .center
        title.backgroundColor = .clear
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        headerBoxLayout()
        backgroundLayout()
        titleLaoyouts()
        searchField.delegate = self
        
    }
    // textField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        titleLables.text = searchField.text
        searchField.text = ""
        return true
    }
    //MARK: Layouts setup
    //========================= layouts setups ==============================
    private func titleLaoyouts() {
        headerBox.addSubview(titleLables)
        headerBox.addSubview(gradus)
        headerBox.addSubview(detail)
        headerBox.addSubview(pogodaImage)
        view.addSubview(searchField)
        // titlelabel layouts
        titleLables.snp.makeConstraints { make in
        
            make.centerX.equalTo(headerBox.snp.centerX)
            make.centerY.equalTo(headerBox.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
            
        }
        gradus.snp.makeConstraints { make in
        
            make.centerX.equalTo(headerBox.snp.centerX)
            make.centerY.equalTo(headerBox.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
            
        }
        detail.snp.makeConstraints { make in
        
            make.centerX.equalTo(headerBox.snp.centerX)
            make.centerY.equalTo(headerBox.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
            
        }
        
        // stackView setup
        let stackView = UIStackView(arrangedSubviews: [titleLables,gradus,detail])
        stackView.axis = .vertical
        stackView.spacing = -25
        headerBox.addSubview(stackView)
        stackView.snp.makeConstraints { make in
        
            make.centerY.equalTo(headerBox.snp.centerY)
            make.leading.equalTo(headerBox.snp.leading).offset(30)
            make.height.equalTo(300)
            make.width.equalTo(300)
            
        }
        // searchField setup layouts
        searchField.snp.makeConstraints { make in
            make.top.equalTo(headerBox.snp.topMargin).offset(20)
            make.centerX.equalTo(headerBox.snp.centerX)
            make.bottomMargin.equalTo(stackView.snp.topMargin)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        // pogoda imageView setup layouts
        pogodaImage.snp.makeConstraints { make in
            make.trailing.equalTo(headerBox.snp.trailing).offset(-20)
            make.top.equalTo(stackView.snp.top)
            make.leading.equalTo(stackView.snp.trailing)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        // mainImage setup layouts
        headerBox.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.centerX.equalTo(headerBox.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(20)
            make.height.equalTo(300)
            make.width.equalTo(400)
        }
        
        
    }
    
    private func backgroundLayout() {
        view.addSubview(background)
        background.image = UIImage(named: "bg")
        background.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(view.snp.height)
            make.width.equalTo(view.snp.width)
        }
    }
    
   private func headerBoxLayout() {
        background.addSubview(headerBox)
       headerBox.backgroundColor = .clear
        headerBox.snp.makeConstraints { make in
            make.centerX.equalTo(background.snp.centerX)
            make.centerY.equalTo(background.snp.centerY)
            make.height.equalTo(background.snp.height)
            make.width.equalTo(background.snp.width)
        }
    }
    //========================= END layouts setups ==============================


}

