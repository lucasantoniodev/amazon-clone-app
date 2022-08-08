import mongoose from 'mongoose';

export default async () => {

    try {
        const DB = process.env.DATABASE_CONNECTION ??= ""
        await mongoose.connect(DB)
        console.log("Connected to database.")
    } catch (error) {
        console.log("Could not connect to database")
    }

}
