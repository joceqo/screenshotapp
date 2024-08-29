//
//  ScreencaptureViewModel.swift
//  screenshotapp
//
//  Created by Jocelin Quéau on 29/08/2024.
//

import SwiftUI

class ScreencaptureViewModel:ObservableObject{
    
    @Published var images = [NSImage]()
    
    func takeScreenshot(){
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = ["-cw"]
        
        do {
            try task.run()
            task.waitUntilExit()
            getImageFromPasteboard()
            
        }catch{
            print("could not take screenshot: \(error)")
        }
    }
    
    private func getImageFromPasteboard(){
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else {
            return
        }
        
        guard let image = NSImage(pasteboard: NSPasteboard.general) else {
            return
        }
        
        self.images.append(image)
    }
}
