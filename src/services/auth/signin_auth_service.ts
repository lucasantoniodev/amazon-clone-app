import bcryptjs from "bcryptjs";
import { UserRepository } from "../../repositories/user_repository";
import 'dotenv/config';
import jwt from "jsonwebtoken";

export class SigninAuthService {
    async execute({ email, password }) {
        try {
            
            const repository = new UserRepository();
            const user = await repository.findUser(email);
          
            if (!user) {
                return new Error("User with this e-mail does not exists");
            }

            if (!await bcryptjs.compare(password, user.password)) {
                return new Error("Password is wrong!");
            }

            const secretKey = process.env.SECRET_KEY ??= ""
            const token = jwt.sign({
                id: user.id
            }, secretKey, {
                expiresIn: 300,
            })

            return {token, user}
        } catch (error) {
            return new Error(error);
        }


    }


}