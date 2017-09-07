//
//  UserController.swift
//  VaporExp
//
//  Created by Yuya Hirayama on 2017/09/07.
//
//

import Vapor
import HTTP

final class UserController: ResourceRepresentable, EmptyInitializable {
  typealias Model = User

  func makeResource() -> Resource<User> {
    return Resource.init(
      index: index,
      create: nil,
      store: store,
      show: show,
      edit: nil,
      update: update,
      replace: nil,
      destroy: nil,
      clear: nil,
      aboutItem: nil,
      aboutMultiple: nil
    )
  }

  func index(_ req: Request) throws -> ResponseRepresentable {
    return try User.all().makeJSON()
  }

  func store(_ req: Request) throws -> ResponseRepresentable {
    throw Abort.init(.forbidden)
  }

  func show(_ req: Request, user: User) throws -> ResponseRepresentable {
    throw Abort.init(.forbidden)
  }

  func delete(_ req: Request, user: User) throws -> ResponseRepresentable {
    throw Abort.init(.forbidden)
  }

  func update(_ req: Request, user: User) throws -> ResponseRepresentable {
    throw Abort.init(.forbidden)
  }
}
