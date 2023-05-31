//
//  Presenter.swift
//  cryptoViper
//
//  Created by Kerim Gaydan on 23.01.2023.
//

import Foundation
//class, protocol
//talks to -> interactor,entity
enum NetworkError : Error {
    case NetworkFailed
    case ParseFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
}
class CryptoPresenter : AnyPresenter {
    
    
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos) :
            view?.update(with: cryptos)
        case .failure(_) :
            view?.update(with: "Try again late...")
        }
    }
    
   
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    
}
