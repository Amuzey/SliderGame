//
//  SliderView.swift
//  SliderGame
//
//  Created by Алексей on 20.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        
        @Binding var currenValue: Double
        
        init(value: Binding<Double>) {
            self._currenValue = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currenValue = Double(sender.value)
            sender.thumbTintColor = .red.withAlphaComponent(0.3)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50))
    }
}

