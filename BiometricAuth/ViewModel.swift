//
//  ViewModel.swift
//  BiometricAuth
//
//  Created by Maxim Vialyx on 3/22/20.
//  Copyright © 2020 Vialyx. All rights reserved.
//

import Foundation
import LocalAuthentication

class ViewModel: ObservableObject {
    
    @Published
    var loggedIn: Bool = false
    @Published
    var hasChanges: Bool = false
    
    private var domainState: Data?
    
    func auth() {
        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Biometric Auth") {
            [weak self] (res, err) in
            DispatchQueue.main.async {
                self?.loggedIn = res
            }
        }
    }
    
    func check() {
        let context = LAContext()
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        checkDomainState(context.evaluatedPolicyDomainState)
    }
    
    private func checkDomainState(_ domainState: Data?) {
        if let `domainState` = domainState {
            if domainState != self.domainState {
                hasChanges = true
            } else {
                hasChanges = false
            }
        }
        self.domainState = domainState
        hasChanges = true
    }
    
}
