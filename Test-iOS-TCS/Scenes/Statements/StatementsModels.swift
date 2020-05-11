//
//  StatementsModels.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

enum StatementsModel {
    enum Header {
        struct Request {
            var headerDataResponse: AccountDetail?
        }
        
        struct Response {
            var headerDataResponse: AccountDetail?
        }
        
        struct ViewModel {
            var name: String
            var account: String
            var balance: String
        }
    }
    
    enum Fetch {
        struct Response {
            let statements: Statement?
        }
        
        struct ViewModel {
            let statementEntries: [StatementList]
        }
    }
}
