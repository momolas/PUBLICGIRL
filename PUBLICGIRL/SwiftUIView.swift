//
//  SwiftUIView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct SwiftUIView: View {
	
    @State private var base: Double = 0.0
    @State private var height: Double = 0.0
    @State private var result: String = ""
    
    let goldenRatio: Double = (1.0 + sqrt(5.0)) / 2 // proportion de la pyramide de Kheops
    
    var body: some View {
        VStack {
            Text("Calcul des dimensions d'une pyramide au nombre d'or")
                .font(.title)
                .padding()
            
            Spacer()
            
            HStack {
                Text("Base de la pyramide :")
                TextField("Base de la pyramide", value: $base, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            HStack {
                Text("Hauteur de la pyramide :")
                TextField("Hauteur de la pyramide", value: $height, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Text(result)
                .padding()
            
            Spacer()
            
            Button("Calculer") {
                let baseValue = base
                let heightValue = height
                let volume = (1/3) * pow(baseValue, 2) * heightValue
                let baseKheops = heightValue * goldenRatio
                
                result = "La base de la pyramide de Kheops avec une hauteur de \(heightValue) est de \(baseKheops), et son volume est de \(volume)"
            }
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .cornerRadius(5)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .preferredColorScheme(.dark)
    }
}
