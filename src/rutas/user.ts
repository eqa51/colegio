import { Router, Request, Response } from "express";

import {
  getPersonas,
  subirImagenCargarEstudiante,
  getUrlImagen,
  deletePersona,
} from "../controladores/persona.controller";

import {} from "../clases/file-system";
export const personasRoutes = Router();

personasRoutes.get("/", (req: Request, res: Response) => {
  getPersonas(req, res);
});

personasRoutes.post("/estudiante", (req: Request, res: Response) => {
  subirImagenCargarEstudiante(req, res);
});

personasRoutes.get("/:id", (req: Request, res: Response) => {
  getUrlImagen(req, res);
});

personasRoutes.delete("/:id", (req: Request, res: Response) => {
  deletePersona(req, res);
});
