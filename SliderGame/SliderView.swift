//
//  SliderView.swift
//  SliderGame
//
//  Created by Алексей on 20.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red.withAlphaComponent(0.5)
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
        Coordinator(currentValue: $currentValue, targetValue: $targetValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        
        @Binding var currenValue: Double
        @Binding var targetValue: Int
        
        init(currentValue: Binding<Double>, targetValue: Binding<Int>) {
            self._currenValue = currentValue
            self._targetValue = targetValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currenValue = Double(sender.value)
            sender.thumbTintColor = .red.withAlphaComponent(opacityCalculate())
        }
        
        private func opacityCalculate() -> CGFloat {
            let difference = CGFloat(abs(targetValue - lround(currenValue))) / 100
            return CGFloat(1 - difference)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), targetValue: .constant(50))
    }
}

