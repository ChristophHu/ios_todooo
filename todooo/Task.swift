//
//  Task.swift
//  todooo
//
//  Created by Christoph Huschenhöfer on 03.08.25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}
