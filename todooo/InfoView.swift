//
//  InfoView.swift
//  todooo
//
//  Created by Christoph Huschenhöfer on 04.08.25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("ToDoApp")
                    .font(.largeTitle)
                    .bold()

                Text("Diese App wurde mit SwiftUI entwickelt und dient als Beispiel für eine einfache Aufgabenverwaltung.")

                Text("Version 1.0.0")
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
            .navigationTitle("Über die App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    InfoView()
}
