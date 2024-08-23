const express = require("express")
const app = express();
const mongoose = require('mongoose')
const dotenv = require('dotenv')
dotenv.config()


const authRouter = require("../server/routes/auth.js");
const connectToDB = require("./config/dbConfig.js");

// Middlewares
app.use(express.json());
app.use(authRouter)
//Connections
connectToDB()


const PORT = 9000;

app.listen(PORT, "0.0.0.0", ()=>{
    console.log("Server running")
})