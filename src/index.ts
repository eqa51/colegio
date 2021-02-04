import Server from "./clases/server";

import bodyParser from "body-parser";

import cors from "cors";

import morgan from "morgan";

import { createConnection } from "typeorm";

import { personasRoutes } from "./rutas/user";
import { gradosRoutes } from "./rutas/grados";

import fileUpload from "express-fileupload";

const server = new Server();

createConnection();

//Configurar CORS

server.app.use(cors({ origin: true, credentials: true }));

server.app.use(morgan("dev"));
//Body parser

//FileUpload
server.app.use(fileUpload({ useTempFiles: true }));

server.app.use(bodyParser.urlencoded({ extended: true }));
server.app.use(bodyParser.json());

//levantar express

//rutas de mi aplicacion
server.app.use("/personas", personasRoutes);
server.app.use("/grados", gradosRoutes);

server.start(() => {
  console.log(`servidor corriendo en puerto ${server.port}`);
});
