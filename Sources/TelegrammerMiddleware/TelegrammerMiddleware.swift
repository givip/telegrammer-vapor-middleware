//
//  File.swift
//  
//
//  Created by Givi on 18.02.2020.
//

import Vapor
import Telegrammer

public class TelegrammerMiddleware: Middleware {
    public let dispatcher: Dispatcher

    private let path: String

    public init(path: String, dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        self.path = path
    }

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        guard request.url.path == "/\(path)" else {
            return next.respond(to: request)
        }
        guard let body = request.body.data else {
            request.logger.critical("Received empty request from Telegram Server")
            return next.respond(to: request)
        }

        dispatcher.enqueue(bytebuffer: body)
        
        return request.eventLoop.makeSucceededFuture(
            Response(
                status: .ok,
                headers: .init(),
                body: .init()
            )
        )
    }
}
