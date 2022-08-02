import { Router } from "express";
import { createUserController } from "../../controllers/auth/create_user_controller";

export const authRoutes = Router();

authRoutes.post("/api/signup", createUserController.handle);
