const pool = require("../config/db");

const obtenerUsuarios = async () => {
    const result = await pool.query(`
        SELECT
            id_usuario,
            nombre,
            apellido,
            usuario,
            tipo,
            estado
        FROM usuarios
        ORDER BY id_usuario
    `);

    return result.rows;
};

const obtenerUsuario = async (id) => {
    const result = await pool.query(
        "SELECT * FROM usuarios WHERE id_usuario=$1",
        [id]
    );

    return result.rows[0];
};

const crearUsuario = async (usuario) => {

    const result = await pool.query(`
        INSERT INTO usuarios
        (nombre,apellido,usuario,password,tipo,estado)
        VALUES($1,$2,$3,$4,$5,$6)
        RETURNING *
    `,
    [
        usuario.nombre,
        usuario.apellido,
        usuario.usuario,
        usuario.password,
        usuario.tipo,
        usuario.estado
    ]);

    return result.rows[0];
};

const actualizarUsuario = async(id,usuario)=>{

    const result=await pool.query(`
    UPDATE usuarios
    SET
    nombre=$1,
    apellido=$2,
    usuario=$3,
    password=$4,
    tipo=$5,
    estado=$6
    WHERE id_usuario=$7
    RETURNING *
    `,
    [
        usuario.nombre,
        usuario.apellido,
        usuario.usuario,
        usuario.password,
        usuario.tipo,
        usuario.estado,
        id
    ]);

    return result.rows[0];
}

const eliminarUsuario=async(id)=>{

    await pool.query(
        "DELETE FROM usuarios WHERE id_usuario=$1",
        [id]
    );

}

module.exports={
    obtenerUsuarios,
    obtenerUsuario,
    crearUsuario,
    actualizarUsuario,
    eliminarUsuario
}