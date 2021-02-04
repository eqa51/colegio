import { Request, Response } from "express";
import { getRepository, getConnection } from "typeorm";

export const getGrados = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const grados = await getConnection().query("SELECT * FROM grado");

  return res.json(grados);
};
