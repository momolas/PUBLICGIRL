//
//  GoldenRatioPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct GoldenRatioPyramidView: View {

    @State private var base: Double = 0.0
    @State private var height: Double = 0.0
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Text("Calcul des dimensions d'une pyramide au nombre d'or")
                .font(.title)
                .padding()
            
            Spacer()
            
            HStack {
                Text("Base de la pyramide :")
                TextField("Base", value: $base, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            HStack {
                Text("Hauteur de la pyramide :")
                TextField("Hauteur", value: $height, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Text(result)
                .padding()
            
            Spacer()
            
            Button("Calculer") {
                let calculation = PyramidCalculator.calculateGoldenRatio(base: base, height: height)
                
                result = "La base de la pyramide de Kheops avec une hauteur de \(height) est de \(calculation.baseKheops), et son volume est de \(calculation.volume)"
            }
            .font(.title3)
            .bold()
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

#Preview {
    GoldenRatioPyramidView()
        .preferredColorScheme(.dark)
}
