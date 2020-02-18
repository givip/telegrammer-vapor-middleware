import Vapor
import Telegrammer
import TelegrammerMiddleware

public func configure(_ app: Application) throws {

    //Don't forget to send WebHooks setting to Telegram servers before use.
    //Use `func setWebhook(params: SetWebhookParams) throws -> Future<Bool>` method

    let bot = try DemoEchoBot(
        token: "Telegram token here. Do not keep token in source code. This is just example"
    )

    app.middleware.use(
        TelegrammerMiddleware(dispatcher: bot.dispatcher)
    )

    try routes(app)
}
