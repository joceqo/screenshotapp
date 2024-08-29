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
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 300))]) {
                    ForEach(vm.images, id:\.self){ image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
//                            .onDrag({NSItemProvider(object: image)})
                            .draggable(image)
                    }
                }
            }
            
            HStack {
                Button("Full screenshot"){
                    vm.takeScreenshot(for: .full)
                }
                Button("Window screenshot"){
                    vm.takeScreenshot(for: .window)
                }
                Button("Area screenshot"){
                    vm.takeScreenshot(for: .area)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
