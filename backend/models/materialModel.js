const pool = require("../config/db");

const obtenerMateriales = async () => {

    const result = await pool.query(`
        SELECT
            id_material,
            nombre,
            descripcion,
            cantidad_total,
            cantidad_disponible,
            ubicacion,
            categoria,
            estado
        FROM materiales
        ORDER BY id_material
    `);

    return result.rows;
};

const obtenerMaterial = async (id) => {

    const result = await pool.query(
        "SELECT * FROM materiales WHERE id_material = $1",
        [id]
    );

    return result.rows[0];
};

const crearMaterial = async (material) => {

    const result = await pool.query(`
        INSERT INTO materiales
        (
            nombre,
            descripcion,
            cantidad_total,
            cantidad_disponible,
            ubicacion,
            categoria,
            estado
        )
        VALUES ($1,$2,$3,$4,$5,$6,$7)
        RETURNING *
    `,
    [
        material.nombre,
        material.descripcion,
        material.cantidad_total,
        material.cantidad_disponible,
        material.ubicacion,
        material.categoria,
        material.estado
    ]);

    return result.rows[0];
};

const actualizarMaterial = async (id, material) => {

    const result = await pool.query(`
        UPDATE materiales
        SET
            nombre = $1,
            descripcion = $2,
            cantidad_total = $3,
            cantidad_disponible = $4,
            ubicacion = $5,
            categoria = $6,
            estado = $7
        WHERE id_material = $8
        RETURNING *
    `,
    [
        material.nombre,
        material.descripcion,
        material.cantidad_total,
        material.cantidad_disponible,
        material.ubicacion,
        material.categoria,
        material.estado,
        id
    ]);

    return result.rows[0];
};

const eliminarMaterial = async (id) => {

    await pool.query(
        "DELETE FROM materiales WHERE id_material = $1",
        [id]
    );

};

module.exports = {
    obtenerMateriales,
    obtenerMaterial,
    crearMaterial,
    actualizarMaterial,
    eliminarMaterial
};