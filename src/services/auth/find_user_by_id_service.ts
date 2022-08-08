import { UserRepository } from "../../repositories/user_repository";

export class FindUserByIDService {
    async execute(userID: string) {
        try {
            const repository = new UserRepository();
            const user = await repository.findById(userID);

            if (!user) {
                return new Error("User does not exists!")
            }

            return user;
        } catch (err) {
            return new Error(err)
        }
    }
}