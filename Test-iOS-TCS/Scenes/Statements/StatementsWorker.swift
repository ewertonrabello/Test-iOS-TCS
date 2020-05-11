//
//  StatementsWorker.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

typealias GetStatementResponseSuccess = (_ response: StatementsModel.Fetch.Response) -> ()
typealias GetStatementResponseFailure = (_ response: String) -> ()

class StatementsWorker {
    
    func getStatements(completionSuccess: @escaping GetStatementResponseSuccess, completionFailure: @escaping GetStatementResponseFailure) {
        guard let urlRequest = URL(string: Constants.URL.statementsUrl) else { return }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data,
                let statements = Statement.parse(data) else {
                    completionFailure(error?.localizedDescription ?? "")
                    return
            }
            
            completionSuccess(StatementsModel.Fetch.Response(statements: statements))
        }.resume()
    }
}
