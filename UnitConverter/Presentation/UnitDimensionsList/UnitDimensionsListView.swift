//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ivan Lopez on 08/11/23.
//

import SwiftUI





struct UnitDimensionsListView: View {
    private let viewModel = UnitDimensionsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.unitDimensions, id: \.self) { unitDimension in
                NavigationLink {
                    EmptyView()
                } label: {
                    VStack {
                        HStack(alignment: .top) {
                            Image(systemName: viewModel.getIcon(from: unitDimension))
                            VStack(alignment: .leading, spacing: 8) {
                                Text(viewModel.getName(from: unitDimension))
                                Text(viewModel.getMeasurementUnitsDescription(from: unitDimension))
                                    .font(.system(.caption))
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Unit Conversions")
            .padding()
        }
    }
}

#Preview {
    UnitDimensionsListView()
}
