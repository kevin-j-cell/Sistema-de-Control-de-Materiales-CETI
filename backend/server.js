require("dotenv").config();

const express = require("express");
const cors = require("cors");
const authRoutes = require("./routes/authRoutes");
const usuariosRoutes=require("./routes/usuarios");
const materialesRoutes = require("./routes/materiales");
const prestamosRoutes = require("./routes/prestamos");

const app = express();

app.use(cors());
app.use(express.json());
app.use("/api/usuarios",usuariosRoutes);
app.use("/api/materiales", materialesRoutes);
app.use("/api/prestamos", prestamosRoutes);

app.use("/api", authRoutes);

app.get("/", (req, res) => {
    res.json({ mensaje: "Servidor funcionando" });
});

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});