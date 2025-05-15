//
//  ContentView.swift
//  ImageClassificationDemo
//
//  Created by EKbana on 14/05/2025.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var images = ["images-1","images-2","images-3","images-4"]
    
    @State private var currentIndex = 0
    @State private var predictionResults:[String:Double] = [:]
    
    let model = try! MobileNetV2(configuration: MLModelConfiguration())
    
    var sortedResult: [Dictionary<String, Double>.Element] {
        predictionResults.sorted { lhs, rhs in
            lhs.value > rhs.value
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Image(images[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350,height: 200)
                
                HStack {
                    Button {
                        if currentIndex != 0 {
                            currentIndex -= 1
                        }
                    } label: {
                        Text("Previous")
                    }.buttonStyle(.bordered)
                        .tint(.red)
                        .disabled(currentIndex == 0)
                    
                    
                    Button {
                        if currentIndex != images.count - 1 {
                            currentIndex += 1
                        }
                    } label: {
                        Text("Next")
                    }.buttonStyle(.bordered)
                        .tint(.red)
                        .disabled(currentIndex == images.count - 1)
                    
                }
                
                Button {
                    // get the image convert it to size and convert that sized image to cv buffer and preduct
                    guard let uiImage = UIImage(named: images[currentIndex]) else {return}
                    let resizedImage = uiImage.resizedTo(width: 224, height: 224)
                    if let buffer = resizedImage?.toCVPixelBuffer() {
                        let prediction = try? model.prediction(image: buffer)
                        self.predictionResults = prediction?.classLabelProbs ?? [:]
                    }
                    
                } label: {
                    Text("Predict")
                }.buttonStyle(.borderedProminent)
                    .tint(.green)
                
                
                List(sortedResult,id:\.0) { (key,value) in
                    HStack {
                        Text(key)
                        Text(NSNumber(value: value),formatter: NumberFormatter.percentage)
                    }
                }
            }
            .padding()
            .navigationTitle("Image Classification")
        }
    }
}

#Preview {
    ContentView()
}
