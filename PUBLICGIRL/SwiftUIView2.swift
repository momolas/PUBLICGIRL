//
//  SwiftUIView2.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct SwiftUIView2: View {
    @State private var base: Double = 0.0
    @State private var result = ""
    
    let phi = (1 + sqrt(5)) / 2
    
    var body: some View {
        VStack {
            Text("Calcul des dimensions d'une pyramide égyptienne")
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
            
            Text(result)
                .font(.headline)
                .padding()
            
            Spacer()
            
            Button(action: calculate) {
                Text("Calculer")
            }
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .cornerRadius(5)
        }
    }
    
    func calculate() {
        
        let arrete = base / (2 * phi)
        let hauteur = arrete * phi
        let apotheme = sqrt(pow(hauteur, 2) + pow(arrete, 2))
        let surfaceArea = base * apotheme
        let volume = (1/3) * base * hauteur
        
        result = """
        Dimensions de la pyramide :
        Arrete : \(arrete.rounded(toPlaces: 2))
        Hauteur : \(hauteur.rounded(toPlaces: 2))
        Apothème : \(apotheme.rounded(toPlaces: 2))
        Surface : \(surfaceArea.rounded(toPlaces: 2))
        Volume : \(volume.rounded(toPlaces: 2))
        """
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
            .preferredColorScheme(.dark)
    }
}
