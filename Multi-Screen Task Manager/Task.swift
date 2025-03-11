//
//  Task.swift
//  Multi-Screen Task Manager
//
//  Created by عبدالله حافظ on 11/09/1446 AH.
//

import SwiftUI

public struct Task: Identifiable, Codable {
    public var id: UUID = UUID()
    public var title: String
    public var isCompleted: Bool = false
}
