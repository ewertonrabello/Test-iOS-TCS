//
//  LoginModels.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

enum LoginModel {
  enum Login {
    struct Request {
      let userId: String?
      let password: String?
    
      func getBody() -> String {
        return "user=\(userId ?? "")&password=\(password ?? "")"
      }
    }
    
    struct Response {
      let user: UserAccount?
    }
    
    struct ViewModel {
      let name: String
      let banckAccount: String
      let agency: String
      let balance: Double
    }
  }
}
