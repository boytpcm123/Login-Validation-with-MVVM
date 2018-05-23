//
//  LoginViewModel.swift
//  Login Validation with MVVM
//
//  Created by ninjaKID on 5/23/18.
//  Copyright © 2018 ninjaKID. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
