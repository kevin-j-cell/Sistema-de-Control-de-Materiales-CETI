const pool = require("../config/db");

const login = async (req, res) => {

    const { usuario, password } = req.body;

    if (!usuario || !password) {
        return res.status(400).json({
            mensaje: "Todos los campos son obligatorios"
        });
    }

    try {

        const consulta = `
            SELECT *
            FROM usuarios
            WHERE usuario = $1
            AND password = $2
        `;

        const resultado = await pool.query(consulta, [usuario, password]);

        if (resultado.rows.length === 0) {
            return res.status(401).json({
                mensaje: "Usuario o contraseña incorrectos"
            });
        }

        const usuarioBD = resultado.rows[0];

        res.json({
            mensaje: "Login correcto",
            usuario: {
                id: usuarioBD.id_usuario,
                nombre: usuarioBD.nombre,
                usuario: usuarioBD.usuario,
                tipo: usuarioBD.tipo
            }
        });

    } catch (error) {

        console.log(error);

        res.status(500).json({
            mensaje: "Error del servidor"
        });

    }

}

module.exports = {
    login
};