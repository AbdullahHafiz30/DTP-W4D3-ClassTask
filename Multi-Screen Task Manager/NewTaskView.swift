//
//  NewTaskView.swift
//  Multi-Screen Task Manager
//
//  Created by Abdullah Hafiz on 11/09/1446 AH.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var taskTitle: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("New Task")) {
                TextField("Enter task", text: $taskTitle)
                    .font(.body)
                    .accessibilityLabel("Task title input")
                    .accessibilityHint("Enter the title for your new task")
            }
            
            Button("Add Task") {
                viewModel.addTask(with: taskTitle)
                dismiss() // Close the view after adding the task
            }
            .font(.body)
            .accessibilityLabel("Add Task")
            .accessibilityHint("Adds the new task and returns to the task list")
            .disabled(taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .navigationTitle("Add Task")
        
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(viewModel: TaskViewModel())
    }
}
