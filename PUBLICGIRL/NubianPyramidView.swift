//
//  NubianPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct NubianPyramidView: View {
    @State private var base: Double = 0.0
    @State private var result = ""

    var body: some View {
        VStack {
            Text("Calcul des dimensions d'une pyramide nubienne")
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

            Text(result)
                .font(.headline)
                .padding()

            Spacer()

            Button("Calculer", action: calculate)
                .font(.title3)
                .bold()
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }

    func calculate() {
        let calc = PyramidCalculator.calculateNubian(base: base)

        result = """
        Dimensions de la pyramide :
        Arrete : \(calc.arrete.formatted(.number.precision(.fractionLength(3))))
        Hauteur : \(calc.hauteur.formatted(.number.precision(.fractionLength(3))))
        Apothème : \(calc.apotheme.formatted(.number.precision(.fractionLength(3))))
        Surface : \(calc.surfaceArea.formatted(.number.precision(.fractionLength(3))))
        Volume : \(calc.volume.formatted(.number.precision(.fractionLength(3))))
        """
    }
}

#Preview {
    NubianPyramidView()
        .preferredColorScheme(.dark)
}
