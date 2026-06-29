const prestamosModel = require("../models/prestamosModel");

const obtenerPrestamos = async (req, res) => {

    try {

        const prestamos = await prestamosModel.obtenerPrestamos();

        res.json(prestamos);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al obtener los préstamos"
        });

    }

};

const obtenerPrestamoPorId = async (req, res) => {

    try {

        const prestamo = await prestamosModel.obtenerPrestamoPorId(req.params.id);

        if (!prestamo) {

            return res.status(404).json({
                mensaje: "Préstamo no encontrado"
            });

        }

        res.json(prestamo);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al obtener el préstamo"
        });

    }

};

const crearPrestamo = async (req, res) => {

    try {

        const prestamo = await prestamosModel.crearPrestamo(req.body);

        res.status(201).json(prestamo);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al crear el préstamo"
        });

    }

};

const actualizarPrestamo = async (req, res) => {

    try {

        const prestamo = await prestamosModel.actualizarPrestamo(
            req.params.id,
            req.body
        );

        res.json(prestamo);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al actualizar el préstamo"
        });

    }

};

const eliminarPrestamo = async (req, res) => {

    try {

        await prestamosModel.eliminarPrestamo(req.params.id);

        res.json({
            mensaje: "Préstamo eliminado correctamente"
        });

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al eliminar el préstamo"
        });

    }

};

module.exports = {
    obtenerPrestamos,
    obtenerPrestamoPorId,
    crearPrestamo,
    actualizarPrestamo,
    eliminarPrestamo
};