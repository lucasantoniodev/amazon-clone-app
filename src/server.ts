// IMPORTS FROM PACKAGES
import express from "express";
import mongoose from "mongoose";
import { authRoutes } from "./routes/auth/auth_routes";
import 'dotenv/config';
// IMPORTS FROM OTHER FILES

// INIT
const app = express();
const DB = process.env.DATABASE_CONNECTION ??= ""

app.use(express.json())

app.use(authRoutes)

mongoose.connect(DB).then(() => {
    console.log("Connection sucessful!")
}).catch((e) => {
    console.log(e);
});


app.listen(3333, "0.0.0.0", () => console.log("Server is running!"));

//Creating an API


