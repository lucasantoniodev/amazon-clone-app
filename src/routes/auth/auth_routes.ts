import { Router } from "express";
import { signinAuthController } from "../../controllers/auth/signin_auth_controller";
import { signupAuthController } from "../../controllers/auth/signup_auth_controller";
import { findUserByIDController } from "../../controllers/auth/find_user_by_id_controller";
import { auth } from "../../middlewares/auth";

export const authRoutes = Router();

authRoutes.post("/api/signup", signupAuthController.handle);

authRoutes.post("/api/signin", signinAuthController.handle);

authRoutes.get("/", auth, findUserByIDController.handle);