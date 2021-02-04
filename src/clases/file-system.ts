import { fileUpload } from "../interface/file-upload";
import path from "path";
import fs from "fs";
import uniqid from "uniqid";

export default class FileSystem {
  constructor() {}

  guardarImagen(file: fileUpload) {
    return new Promise((resolve, reject) => {
      const ruta = path.resolve(__dirname, "../uploads");

      const nombreArchivo = this.generarNombreUnico(file.name);
      file.mv(`${ruta}/${nombreArchivo}`, (err: any) => {
        if (err) {
          reject(err);
        } else {
          resolve(nombreArchivo);
        }
      });
    });
  }

  private generarNombreUnico(nombreOriginal: string) {
    const nombreArr = nombreOriginal.split(".");
    const extension = nombreArr[nombreArr.length - 1];

    const idUnico = uniqid();

    return `${idUnico}.${extension}`;
  }

  getFotoURL(nombreImagen: string) {
    const pathPost = path.resolve(__dirname, "../uploads", nombreImagen);

    return pathPost;
  }
}
