//
//  File.swift
//  
//
//  Created by Givi on 18.02.2020.
//

import Vapor
import Telegrammer

public class TelegrammerMiddleware: Middleware {
    public var dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
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
