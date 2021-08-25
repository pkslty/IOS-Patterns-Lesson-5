//
//  Task.swift
//  Tasks
//
//  Created by Denis Kuzmin on 25.08.2021.
//

import UIKit

protocol Task {
    var name: String { get }
    var description: String { get set}
    func openTask()
}
