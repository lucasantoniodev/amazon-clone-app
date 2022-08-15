import jwt from 'jsonwebtoken';
import { UserRepository } from '../../repositories/user_repository';

export class TokenValidationService {
    async execute(token?: string) {
        try {
            if (!token) return false;

            const secretKey = process.env.SECRET_KEY as string
            const decoded = jwt.verify(token, secretKey);

            if (!decoded) return false;

            const repository = new UserRepository();

            const user = await repository.findById(decoded['id']);
            if (!user) return false;

            return true
        } catch (error) {
            return new Error(error.message);
        }
    }
}