//
//  User.swift
//  VaporExp
//
//  Created by Yuya Hirayama on 2017/09/07.
//
//

import Vapor
import FluentProvider
import HTTP

final class User: Model {

  // - MARK: Properties
  let id: Int
  var name: String

  func makeRow() throws -> Row {
    var row = Row.init()
    try row.set("id", id)
    try row.set("name", name)

    return row
  }

  init(row: Row) throws {
    id = try row.get("id")
    name = try row.get("name")
  }

  var storage: Storage = .init()
}

extension User: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON.init()
    try json.set("id", id)
    try json.set("name", name)

    return json
  }
}

extension User: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(self, closure: { (builder) in
      builder.id()
      builder.string("name")
    })
  }

  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}
