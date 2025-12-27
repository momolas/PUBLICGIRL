//
//  ContentView.swift
//  PUBLICGIRL
//
//  Created by Mo on 15/11/2022.
//

import SwiftUI

struct LaunchView: View {

    // Enum to define navigation destinations
    enum PyramidType: String, CaseIterable, Hashable {
        case goldenRatio = "Pyramide au Nombre d'Or"
        case egyptian = "Pyramide Égyptienne"
        case nubian = "Pyramide Nubienne"
    }
	
	var body: some View {
		NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("PUBLICGIRL")
                            .font(.largeTitle)
                            .bold()

                        Text("Une application pour calculer les dimensions d'une pyramide")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                }

                Section("Calculateurs") {
                    NavigationLink(value: PyramidType.goldenRatio) {
                        Label("Pyramide au Nombre d'Or", systemImage: "arrow.triangle.2.circlepath")
                    }

                    NavigationLink(value: PyramidType.egyptian) {
                        Label("Pyramide Égyptienne", systemImage: "pyramid")
                    }

                    NavigationLink(value: PyramidType.nubian) {
                        Label("Pyramide Nubienne", systemImage: "triangle")
                    }
                }
            }
            .navigationTitle("Accueil")
            .navigationBarHidden(true)
            .navigationDestination(for: PyramidType.self) { type in
                switch type {
                case .goldenRatio:
                    GoldenRatioPyramidView()
                case .egyptian:
                    EgyptianPyramidView()
                case .nubian:
                    NubianPyramidView()
                }
            }
		}
	}
}

#Preview {
	LaunchView()
		.preferredColorScheme(.dark)
}
