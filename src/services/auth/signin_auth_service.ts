import bcryptjs from "bcryptjs";
import { UserRepository } from "../../repositories/user_repository";
import 'dotenv/config';
import jwt from "jsonwebtoken";

export class SigninAuthService {
    async execute({ email, password }) {
        try {
            const repository = new UserRepository();
            const findUser = await repository.findUser(email);

            if (!findUser) {
                return new Error("E-mail does not exists");
            }

            if (!await bcryptjs.compare(password, findUser.password)) {
                return new Error("Password is wrong!");
            }

            const secretKey = process.env.SECRET_KEY ??= ""

            const token = jwt.sign({
                id: findUser.id,
            }, secretKey, {
                expiresIn: 300,
            })

            return token
        } catch (error) {
            return new Error(error);
        }


    }


}