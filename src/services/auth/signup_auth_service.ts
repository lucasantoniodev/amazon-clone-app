import { UserInterface } from "../../interfaces/user_interface";
import { UserRepository } from "../../repositories/user_repository";
import bcryptjs from "bcryptjs";

type UserRequest = {
    email: string,
    name: string,
    password: string
}

export class SignupAuthService {
    async execute({ email, name, password }: UserRequest): Promise<UserInterface | Error> {

        const userRepository = new UserRepository();

        const user = await userRepository.findUser(email);

        if (user) {
            return new Error("User with same e-mail already exists!");
        }

        try {
            const hashedPassword = await bcryptjs.hash(password, 8);
            
            const createdUser = await userRepository.createUser(
                {
                    email,
                    name,
                    password: hashedPassword
                }
            );
            return createdUser
        } catch (e) {
            return new Error(e.message);
        }

    }

}