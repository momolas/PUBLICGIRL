//
//  EgyptianPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct EgyptianPyramidView: View {
    @State private var viewModel = EgyptianViewModel()

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
                    LabeledContent("Arrête", value: result.arrete, format: .number.precision(.fractionLength(2)))
                    LabeledContent("Hauteur", value: result.hauteur, format: .number.precision(.fractionLength(2)))
                    LabeledContent("Apothème", value: result.apotheme, format: .number.precision(.fractionLength(2)))
                    LabeledContent("Surface", value: result.surfaceArea, format: .number.precision(.fractionLength(2)))
                    LabeledContent("Volume", value: result.volume, format: .number.precision(.fractionLength(2)))
                }
            }
        }
        .navigationTitle("Pyramide Égyptienne")
    }
}

#Preview {
    NavigationStack {
        EgyptianPyramidView()
            .preferredColorScheme(.dark)
    }
}
