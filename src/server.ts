// IMPORTS FROM PACKAGES
import express from "express";
import { authRoutes } from "./routes/auth/auth_routes";
import 'dotenv/config';

// IMPORTS FROM OTHER FILES
import dbConnection from '../src/database/mongoose_connect'

// INIT
const app = express();
dbConnection()

app.use(express.json())

app.use(authRoutes)

const port = process.env.PORT || 8080
app.listen(parseInt(port), "0.0.0.0", () => console.log(`Server start: Listening on port ${port}...`));

//Creating an API


