//
//  ContentView.swift
//  Swift-MVVM-Arch
//
//  Created by Himanshu Patwardhan on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListAllBreedsViewFactory.buildView()
    }
}

#Preview {
    ContentView()
}
