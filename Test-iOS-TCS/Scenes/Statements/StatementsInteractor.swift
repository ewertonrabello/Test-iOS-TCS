//
//  StatementsInteractor.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

protocol StatementsBusinessLogic {
    func getStatements()
    func getHeader(data: StatementsModel.Header.Request)
}

protocol StatementsDataStore {
    var userAccount: AccountDetail? { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore {
    var userAccount: AccountDetail?
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
        
    func getHeader(data: StatementsModel.Header.Request) {
        let response = StatementsModel.Header.Response(headerDataResponse: data.headerDataResponse)
        presenter?.setupHeader(data: response)
    }
  
    func getStatements() {
        if worker == nil {
            worker = StatementsWorker()
        }
        
        worker?.getStatements(completionSuccess: { (response) in
            DispatchQueue.main.async {
                self.presenter?.presentGetStatements(response: response)
            }
        }, completionFailure: { (error) in
            DispatchQueue.main.async {
                self.presenter?.presenGetStatementsError(error: error)
            }
        })
    }
}
