//
//  GoldenRatioPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct GoldenRatioPyramidView: View {

    @State private var viewModel = GoldenRatioViewModel()

    var body: some View {
        Form {
            Section("Entrées") {
                TextField("Base", value: $viewModel.base, format: .number)
                    .keyboardType(.decimalPad)

                TextField("Hauteur", value: $viewModel.height, format: .number)
                    .keyboardType(.decimalPad)

                Button("Calculer") {
                    viewModel.calculate()
                }
            }

            if let result = viewModel.result {
                Section("Résultats") {
                    LabeledContent("Base Kheops", value: result.baseKheops, format: .number.precision(.fractionLength(2)))
                    LabeledContent("Volume", value: result.volume, format: .number.precision(.fractionLength(2)))
                }
            }
        }
        .navigationTitle("Nombre d'Or")
    }
}

#Preview {
    NavigationStack {
        GoldenRatioPyramidView()
            .preferredColorScheme(.dark)
    }
}
