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
        VStack(spacing: 20) {
            Text("Pyramide Égyptienne")
                .font(.largeTitle)
                .bold()

            Text("Entrez la base pour calculer")
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer()

            TextField("Base", value: $viewModel.base, format: .number)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .keyboardType(.decimalPad)

            Button(action: {
                viewModel.calculate()
            }) {
                Label("Calculer", systemImage: "function")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if let result = viewModel.result {
                VStack(spacing: 10) {
                    Divider()

                    ResultRow(title: "Arrête", value: result.arrete)
                    ResultRow(title: "Hauteur", value: result.hauteur)
                    ResultRow(title: "Apothème", value: result.apotheme)
                    ResultRow(title: "Surface", value: result.surfaceArea)
                    ResultRow(title: "Volume", value: result.volume)
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

struct ResultRow: View {
    let title: String
    let value: Double

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value, format: .number.precision(.fractionLength(2)))
                .bold()
        }
    }
}

#Preview {
    NavigationStack {
        EgyptianPyramidView()
            .preferredColorScheme(.dark)
    }
}
