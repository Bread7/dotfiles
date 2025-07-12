'use strict'

import Fastify from "fastify"

const fastify = Fastify({
    logger: true
})

fastify.get("/", async (req, reply) => {
    reply.type("text/plain").code(200)
    // return { hello: "world" }
    return "api.unmap(\"<ctrl-i>\");"
})

fastify.listen({
    port: 3000,
}, (err, address) => {
    if (err) throw err
})
