//
//  Matrix.swift
//  ToDo
//
//  Created by Guy Kahlon on 11/23/16.
//  Copyright © 2016 Guy. All rights reserved.
//

import Foundation

func * (left: UInt, right: UInt) -> UInt {
  let result = Int(left) * Int(right)
  return UInt(result)
}

struct Matrix {
  
  let rows: UInt
  let columns: UInt
  
  var grid: [UInt]
  
  init(rows: UInt, columns: UInt) {
    
    self.rows = rows
    self.columns = columns
    let count = Int(rows * columns)
    grid = Array(repeating: 0, count: count)
  }
  
  init(grid: [UInt], rows: UInt, columns: UInt) {
    self.rows = rows
    self.columns = columns
    self.grid = grid
  }
  
  func indexIsValid(_ row: UInt, column: UInt) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
  }
  
  subscript(row: UInt, column: UInt) -> UInt {
    get {
      assert(indexIsValid(row, column: column), "Index out of range")
      return grid[Int((row * columns) + column)]
    }
    set {
      assert(indexIsValid(row, column: column), "Index out of range")
      grid[Int((row * columns) + column)] = newValue
    }
  }
}

extension Matrix: CustomStringConvertible {
  
  var description: String {
    
    var str = String()
  
    for r in 0..<rows {
      for c in 0..<columns {
        str += "\(self[r,c]) "
      }
      str += "\n"
    }
  
    return str
  }
}


