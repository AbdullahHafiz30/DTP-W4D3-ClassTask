//
//  ContentView.swift
//  Multi-Screen Task Manager
//
//  Created by Abdullah hafiz on 11/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = false
    @StateObject private var viewModel = TaskViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing:20){
                    Toggle(isOn: $isDarkMode){
                        Text(isDarkMode ? "Dark Mode" : "Light Mode").font(.headline)
                    }.padding()
                        .accessibilityLabel("Dark mode toggle")
                        .accessibilityHint("Switch between dark and light themes")
                    Spacer()
                    
                    Form {
                        Section(header: Text("Tasks")) {
                            ForEach(viewModel.sortedTasks) { task in
                                HStack {
                                    Button(action: {
                                        viewModel.toggleTaskCompletion(task)
                                        viewModel.saveTasks() // Persist the updated status
                                    }) {
                                        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                                    }
                                    .accessibilityLabel(task.isCompleted ? "Mark as incomplete" : "Mark as complete")
                                    .accessibilityHint("Toggles the completion status of this task")
                                    
                                    Text(task.title)
                                        .strikethrough(task.isCompleted, color: .gray)
                                        .foregroundColor(task.isCompleted ? .gray : .primary)
                                        .accessibilityLabel(task.title)
                                        .accessibilityHint(task.isCompleted ? "Task completed" : "Task not completed")
                                }
                            }
                            .onDelete(perform: viewModel.deleteTasks)
                        }
                    }
                }
            }.navigationBarTitle("Task Manager")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NewTaskView(viewModel: viewModel)) {
                            Text("Add Task")
                            Image(systemName: "plus")
                            
                        }
                        .accessibilityLabel("Add new task")
                        .accessibilityHint("Navigates to the add task screen")
                    }
                }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
