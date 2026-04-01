const mongoose = require("mongoose")

let connectionPromise = null

async function connectToDB() {
    if (mongoose.connection.readyState === 1) {
        return mongoose.connection
    }

    if (!connectionPromise) {
        connectionPromise = mongoose.connect(process.env.MONGO_URI)
            .then((connection) => {
                console.log("Connected to Database")
                return connection
            })
            .catch((err) => {
                connectionPromise = null
                console.log(err)
                throw err
            })
    }

    return connectionPromise
}

module.exports = connectToDB
