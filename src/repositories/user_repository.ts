import { UserInterface } from "../interfaces/user_interface";
import { User } from "../models/user";

export class UserRepository {
    async createUser({ email, name, password }) {
        let user = new User({
            email,
            name,
            password
        });
        return await user.save();
    }

    async findUser(email: string) {
        return await User.findOne({ email });
    }

    async findById(id: string) {
        return await User.findById(id).select("-password -__v");
    }
}