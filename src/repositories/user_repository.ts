import { UserInterface } from "../interfaces/user_interface";
import { User } from "../schemas/user";

export class UserRepository {

    async createUser({ email, name, password }) {
        let user = new User({
            email,
            name,
            password
        });
        return await user.save();
    }

    async findUser(email: string): Promise<UserInterface | null> {
        return await User.findOne({ email });
    }

}