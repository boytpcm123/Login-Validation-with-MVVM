//
//  ViewController.swift
//  Login Validation with MVVM
//
//  Created by ninjaKID on 5/23/18.
//  Copyright © 2018 ninjaKID. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = emailTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind(to: buttonLogin.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { (isValid) in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? .green : .red
            //print("isValid = \(isValid)")
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

