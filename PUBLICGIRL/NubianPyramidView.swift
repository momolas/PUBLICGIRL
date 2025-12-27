//
//  NubianPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct NubianPyramidView: View {
    @State private var viewModel = NubianViewModel()

    var body: some View {
        Form {
            Section("Entrées") {
                TextField("Base", value: $viewModel.base, format: .number)
                    .keyboardType(.decimalPad)

                Button("Calculer") {
                    viewModel.calculate()
                }
            }

            if let result = viewModel.result {
                Section("Résultats") {
                    LabeledContent("Arrête", value: result.arrete, format: .number.precision(.fractionLength(3)))
                    LabeledContent("Hauteur", value: result.hauteur, format: .number.precision(.fractionLength(3)))
                    LabeledContent("Apothème", value: result.apotheme, format: .number.precision(.fractionLength(3)))
                    LabeledContent("Surface", value: result.surfaceArea, format: .number.precision(.fractionLength(3)))
                    LabeledContent("Volume", value: result.volume, format: .number.precision(.fractionLength(3)))
                }
            }
        }
        .navigationTitle("Pyramide Nubienne")
    }
}

#Preview {
    NavigationStack {
        NubianPyramidView()
            .preferredColorScheme(.dark)
    }
}
