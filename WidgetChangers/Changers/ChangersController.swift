//
//  Changers.swift
//  WidgetExample
//
//  Created by Clement Yerochewski on 20.07.21.
//

import Foundation
import ChangersSDK

class ChangersController: NSObject {
        
    lazy var changers = Changers()

    func handleChangersSDK() {
        changers.delegate = self
        changers.authenticationDelegate = self
//        changers.cleanState()
        changers.initSDK(with: ChangersHelper.config, uuid: ChangersHelper.changersUUID)
    }
    
    func application(handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        Changers.handleEvents(forBackgroundURLSession: identifier, completionHandler: completionHandler)
    }


    
}

extension ChangersController: ChangersAuthenticationDelegate {
    func didUpdateCredentials(with uiid: String) {
//        print("didUpdateCredentials : ", uiid, " from previous uuid : ", ChangersHelper.changersUUID)
//        if ChangersHelper.changersUUID != uiid {
//            changers.fetchStatistic()
//        }
        ChangersHelper.changersUUID = uiid
    }
    
    
}

extension ChangersController: ChangersDelegate {
    func setupDidFinish() {
//        print("setupDidFinish")
//        sdkDelegate?.ready()
//        changers.fetchStatistic()
    }

    func setupDidFail(with error: ChangersAuthenticateError?) {
//        print("fail with error: ", error)
    }


}

