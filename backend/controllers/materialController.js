const Material = require("../models/materialModel");

// Obtener todos los materiales
const listar = async (req, res) => {

    try {

        const materiales = await Material.obtenerMateriales();

        res.json(materiales);

    } catch (error) {

        res.status(500).json({
            mensaje: error.message
        });

    }

};

// Obtener un material por ID
const obtener = async (req, res) => {

    try {

        const material = await Material.obtenerMaterial(req.params.id);

        if (!material) {

            return res.status(404).json({
                mensaje: "Material no encontrado"
            });

        }

        res.json(material);

    } catch (error) {

        res.status(500).json({
            mensaje: error.message
        });

    }

};

// Crear un nuevo material
const crear = async (req, res) => {

    try {

        const nuevo = await Material.crearMaterial(req.body);

        res.status(201).json(nuevo);

    } catch (error) {

        res.status(500).json({
            mensaje: error.message
        });

    }

};

// Actualizar un material
const actualizar = async (req, res) => {

    try {

        const material = await Material.actualizarMaterial(
            req.params.id,
            req.body
        );

        res.json(material);

    } catch (error) {

        res.status(500).json({
            mensaje: error.message
        });

    }

};

// Eliminar un material
const eliminar = async (req, res) => {

    try {

        await Material.eliminarMaterial(req.params.id);

        res.json({
            mensaje: "Material eliminado correctamente"
        });

    } catch (error) {

        res.status(500).json({
            mensaje: error.message
        });

    }

};

module.exports = {
    listar,
    obtener,
    crear,
    actualizar,
    eliminar
};