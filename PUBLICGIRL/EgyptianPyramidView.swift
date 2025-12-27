//
//  EgyptianPyramidView.swift
//  PUBLICGIRL
//
//  Created by Mo on 19/04/2023.
//

import SwiftUI

struct EgyptianPyramidView: View {
    @State private var viewModel = EgyptianViewModel()

    var isInputValid: Bool {
        viewModel.base > 0
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Pyramide Égyptienne")
                    .font(.largeTitle)
                    .bold()
                    .accessibilityAddTraits(.isHeader)

                Text("Entrez la base pour calculer")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer(minLength: 20)

                TextField("Base", value: $viewModel.base, format: .number)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .keyboardType(.decimalPad)
                    .dismissKeyboardOnTap()
                    .accessibilityLabel("Base de la pyramide")
                    .accessibilityHint("Entrez la longueur de la base")

                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        viewModel.calculate()
                    }
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }) {
                    Label("Calculer", systemImage: "function")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isInputValid ? Color.orange.opacity(0.1) : Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(isInputValid ? .primary : .secondary)
                }
                .disabled(!isInputValid)
                .accessibilityLabel("Lancer le calcul")
                .accessibilityHint(isInputValid ? "Calcule les dimensions basées sur vos entrées" : "Veuillez entrer une valeur valide supérieure à 0")

                if let result = viewModel.result {
                    VStack(spacing: 10) {
                        Divider()

                        PyramidResultRow(title: "Arrête", value: result.arrete, precision: 2)
                        PyramidResultRow(title: "Hauteur", value: result.hauteur, precision: 2)
                        PyramidResultRow(title: "Apothème", value: result.apotheme, precision: 2)
                        PyramidResultRow(title: "Surface", value: result.surfaceArea, precision: 2)
                        PyramidResultRow(title: "Volume", value: result.volume, precision: 2)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .transition(.scale.combined(with: .opacity))
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Résultats du calcul")
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EgyptianPyramidView()
            .preferredColorScheme(.dark)
    }
}
