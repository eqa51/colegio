import { Router, Request, Response } from "express";

import { getGrados } from "../controladores/grado.controller";

export const gradosRoutes = Router();

gradosRoutes.get("/", (req: Request, res: Response) => {
  getGrados(req, res);
});
