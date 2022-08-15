import { Request, Response } from "express";
import { TokenValidationService } from "../../services/auth/token_validation_service";

class TokenValidationController {
    async handle(request: Request, response: Response) {
        const token = request.header("x-auth-token");

        const validationService = new TokenValidationService();
        const result = await validationService.execute(token);

        if (result instanceof Error) {
            return response.status(400).send(false);
        }

        if (!result) {
            return response.status(400).send(result);
        }



        return response.send(result)

    }
}

export const tokenValidationController = new TokenValidationController();