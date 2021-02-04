import { Request, Response } from "express";
import { getConnection } from "typeorm";
import { fileUpload } from "../interface/file-upload";

import FileSystem from "../clases/file-system";
const fileSystem = new FileSystem();

export const getPersonas = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const users = await getConnection().query(
    "SELECT * FROM persona inner join grado on  persona.nid_grado = grado.nid_grado;"
  );

  return res.json(users);
};

export const subirImagenCargarEstudiante = async (req: any, res: Response) => {
  const nombres = req.body.nombres;
  const ApellidoMaterno = req.body.ApellidoMaterno;
  const ApellidoPaterno = req.body.ApellidoPaterno;
  const fecha = req.body.fecha;
  const grado = req.body.grado;

  const file: fileUpload = req.files.imagen;

  if (!file) {
    return res.status(400).json({
      ok: false,
      mensaje: "no se subio ningun archivo-img",
    });
  }

  if (!file.mimetype.includes("image")) {
    return res.status(400).json({
      ok: false,
      mensaje: "lo que subio no es una imagen",
    });
  }

  const nombreImagen = await fileSystem.guardarImagen(file);

  const persona = await getConnection().query(
    "call insertarEstudianteMovimientos(?,?,?,?,?,?)",
    [nombres, ApellidoPaterno, ApellidoMaterno, nombreImagen, grado, fecha]
  );

  res.json({
    ok: true,
    mensaje: "Subido con exito",
  });
};

export const getUrlImagen = async (req: Request, res: Response) => {
  const url = fileSystem.getFotoURL(req.params.id) || "";

  res.sendFile(url);
};

export const deletePersona = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const persona = await getConnection().query(
    ` delete persona,movimiento
    from persona
    join movimiento
    on persona.nid_persona=movimiento.id_persona
    where persona.nid_persona =${req.params.id};`
  );

  return res.json(persona);
};
