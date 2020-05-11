//
//  LoginPresenter.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
  func getSavedUserName(userName: String)
  func presentLogin(response: LoginModel.Login.Response)
  func showAlertError(error: String)
}

class LoginPresenter {
  weak var viewController: LoginDisplayLogic?
}

// MARK: - Privates Presentation Logic
extension LoginPresenter: LoginPresentationLogic {
  func getSavedUserName(userName: String) {
    viewController?.saveUserName(username: userName)
  }
  
  func presentLogin(response: LoginModel.Login.Response) {
    let viewModel = LoginModel.Login.ViewModel(name: response.user?.userAccount?.name ?? "", banckAccount: response.user?.userAccount?.bankAccount ?? "", agency: response.user?.userAccount?.agency ?? "", balance: response.user?.userAccount?.balance ?? 0.0)
    viewController?.getData(viewModel: viewModel)
  }
  
  func showAlertError(error: String) {
    viewController?.showAlertError(message: error)
  }
}
