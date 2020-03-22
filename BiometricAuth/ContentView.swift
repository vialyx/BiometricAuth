//
//  ContentView.swift
//  BiometricAuth
//
//  Created by Maxim Vialyx on 3/22/20.
//  Copyright © 2020 Vialyx. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Biometric Auth")
                .font(.title)
            Spacer()
                .frame(height: 20)
            Button(action: {
                self.viewModel.auth()
            }) {
                Text("Perform Auth")
            }
            Spacer()
            Button(action: {
                self.viewModel.check()
            }) {
                Text("Check Domain State")
            }
            Spacer()
                .frame(height: 20)
            if viewModel.hasChanges {
                Text("DomainState changed")
            } else {
                Text("DomainState hasn't changes")
            }
            Spacer()
            Text("Read more on https://medium.com/@vialyx")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
