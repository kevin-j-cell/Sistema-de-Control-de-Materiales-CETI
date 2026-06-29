const pool = require("../config/db");

const obtenerPrestamos = async () => {

    const result = await pool.query(`
        SELECT
            p.id_prestamo,
            p.id_usuario_encargado,
            CONCAT(u.nombre, ' ', COALESCE(u.apellido, '')) AS usuario_encargado,
            p.matricula,
            p.nombre_solicitante,
            p.fecha_solicitud,
            p.fecha_entrega,
            p.estado,
            p.observaciones
        FROM prestamos p
        INNER JOIN usuarios u
            ON p.id_usuario_encargado = u.id_usuario
        ORDER BY p.id_prestamo DESC
    `);

    return result.rows;
};

const obtenerPrestamoPorId = async (id) => {

    const result = await pool.query(`
        SELECT
            id_prestamo,
            id_usuario_encargado,
            matricula,
            nombre_solicitante,
            fecha_solicitud,
            fecha_entrega,
            estado,
            observaciones
        FROM prestamos
        WHERE id_prestamo = $1
    `,[id]);

    return result.rows[0];
};

const crearPrestamo = async (prestamo) => {

    const {
        id_usuario_encargado,
        matricula,
        nombre_solicitante,
        fecha_solicitud,
        fecha_entrega,
        estado,
        observaciones
    } = prestamo;

    const result = await pool.query(`
        INSERT INTO prestamos
        (
            id_usuario_encargado,
            matricula,
            nombre_solicitante,
            fecha_solicitud,
            fecha_entrega,
            estado,
            observaciones
        )
        VALUES ($1,$2,$3,$4,$5,$6,$7)
        RETURNING *
    `,
    [
        id_usuario_encargado,
        matricula,
        nombre_solicitante,
        fecha_solicitud,
        fecha_entrega,
        estado,
        observaciones
    ]);

    return result.rows[0];
};

const actualizarPrestamo = async (id, prestamo) => {

    const {
        id_usuario_encargado,
        matricula,
        nombre_solicitante,
        fecha_solicitud,
        fecha_entrega,
        estado,
        observaciones
    } = prestamo;

    const result = await pool.query(`
        UPDATE prestamos
        SET
            id_usuario_encargado=$1,
            matricula=$2,
            nombre_solicitante=$3,
            fecha_solicitud=$4,
            fecha_entrega=$5,
            estado=$6,
            observaciones=$7
        WHERE id_prestamo=$8
        RETURNING *
    `,
    [
        id_usuario_encargado,
        matricula,
        nombre_solicitante,
        fecha_solicitud,
        fecha_entrega,
        estado,
        observaciones,
        id
    ]);

    return result.rows[0];
};

const eliminarPrestamo = async (id) => {

    await pool.query(`
        DELETE FROM prestamos
        WHERE id_prestamo=$1
    `, [id]);
};

module.exports = {
    obtenerPrestamos,
    obtenerPrestamoPorId,
    crearPrestamo,
    actualizarPrestamo,
    eliminarPrestamo
};