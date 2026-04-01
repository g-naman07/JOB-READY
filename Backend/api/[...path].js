const path = require("path")

require("dotenv").config({
    path: path.resolve(__dirname, "../.env")
})

const app = require("../src/app")
const connectToDB = require("../src/config/database")

module.exports = async (req, res) => {
    await connectToDB()
    return app(req, res)
}
