//
//  TaskViewModel.swift
//  Multi-Screen Task Manager
//
//  Created by Abdullah Hafiz on 11/09/1446 AH.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    // Sort tasks so incomplete ones appear first
    var sortedTasks: [Task] {
        tasks.sorted { !$0.isCompleted && $1.isCompleted }
    }
    
    // Add a new task
    func addTask(with title: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return } // ignore if empty
        tasks.append(Task(title: trimmedTitle))
        saveTasks()
    }
    
    // Toggle a task’s completion
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    // Delete task(s)
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "tasks") else { return }
        do {
            let decoded = try JSONDecoder().decode([Task].self, from: data)
            tasks = decoded
        } catch {
            print("Unable to decode expenses: \(error.localizedDescription)")
        }
    }
    
    func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "tasks")
        } catch {
            print("Unable to encode expenses: \(error.localizedDescription)")
        }
    }
}
