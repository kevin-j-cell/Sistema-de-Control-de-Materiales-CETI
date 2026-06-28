const Usuario=require("../models/usuarioModel");

const listar=async(req,res)=>{

    try{

        const usuarios=await Usuario.obtenerUsuarios();
        res.json(usuarios);

    }catch(error){

        res.status(500).json({mensaje:error.message});

    }

}

const obtener=async(req,res)=>{

    try{

        const usuario=await Usuario.obtenerUsuario(req.params.id);

        res.json(usuario);

    }catch(error){

        res.status(500).json({mensaje:error.message});

    }

}

const crear=async(req,res)=>{

    try{

        const nuevo=await Usuario.crearUsuario(req.body);

        res.status(201).json(nuevo);

    }catch(error){

        res.status(500).json({mensaje:error.message});

    }

}

const actualizar=async(req,res)=>{

    try{

        const usuario=await Usuario.actualizarUsuario(req.params.id,req.body);

        res.json(usuario);

    }catch(error){

        res.status(500).json({mensaje:error.message});

    }

}

const eliminar=async(req,res)=>{

    try{

        const usuario = await Usuario.obtenerUsuario(req.params.id);

        if (!usuario) {
            return res.status(404).json({
                mensaje: "Usuario no encontrado"
            });
        }

        if (usuario.usuario === "kevin") {
            return res.status(403).json({
                mensaje: "Este usuario no puede eliminarse."
            });
        }

        await Usuario.eliminarUsuario(req.params.id);

        res.json({
            mensaje: "Usuario eliminado"
        });

    }catch(error){

        res.status(500).json({mensaje:error.message});

    }

}

module.exports={
listar,
obtener,
crear,
actualizar,
eliminar
}