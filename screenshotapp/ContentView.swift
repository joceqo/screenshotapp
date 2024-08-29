//
//  ContentView.swift
//  screenshotapp
//
//  Created by Jocelin Quéau on 29/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ScreencaptureViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            ForEach(vm.images, id:\.self){ image in
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Button("Make a screenshot"){
                vm.takeScreenshot()
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
