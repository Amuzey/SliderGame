//
//  SliderView.swift
//  SliderGame
//
//  Created by Алексей on 20.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50))
    }
}

