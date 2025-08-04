import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    @State private var showingInfo = false
    
    // dark/light-mode
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var systemColorScheme

    var body: some View {
        NavigationView {
            VStack {
                // Eingabezeile für neue Aufgaben
                HStack {
                    TextField("Neue Aufgabe", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus")
                            .padding(8)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()

                // Aufgabenliste
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isDone ? .green : .gray)
                            Text(task.title)
                                .strikethrough(task.isDone)
                                .foregroundColor(task.isDone ? .gray : .primary)
                        }
                        .onTapGesture {
                            viewModel.toggleDone(for: task)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(role: .destructive) {
                            viewModel.tasks.removeAll()
                        } label: {
                            Label("Alle löschen", systemImage: "trash")
                        }

                        Button {
                            showingInfo = true
                        } label: {
                            Label("Über die App", systemImage: "info.circle")
                        }

                        Button {
                            isDarkMode.toggle()
                        } label: {
                            Label(isDarkMode ? "Hellmodus aktivieren" : "Dunkelmodus aktivieren",
                                  systemImage: isDarkMode ? "sun.max.fill" : "moon.fill")
                        }

                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showingInfo) {
                InfoView()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
