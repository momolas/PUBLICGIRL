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
        VStack(spacing: 20) {
            Text("Nombre d'Or")
                .font(.largeTitle)
                .bold()

            Text("Entrez les dimensions pour calculer")
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer()

            VStack(spacing: 15) {
                TextField("Base", value: $viewModel.base, format: .number)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .keyboardType(.decimalPad)

                TextField("Hauteur", value: $viewModel.height, format: .number)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .keyboardType(.decimalPad)
            }

            Button(action: {
                viewModel.calculate()
            }) {
                Label("Calculer", systemImage: "function")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if let result = viewModel.result {
                VStack(spacing: 10) {
                    Divider()

                    HStack {
                        Text("Base Kheops")
                        Spacer()
                        Text(result.baseKheops, format: .number.precision(.fractionLength(2)))
                            .bold()
                    }

                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(result.volume, format: .number.precision(.fractionLength(2)))
                            .bold()
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GoldenRatioPyramidView()
            .preferredColorScheme(.dark)
    }
}
