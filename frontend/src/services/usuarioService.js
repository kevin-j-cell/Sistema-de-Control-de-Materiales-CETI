const API = "http://localhost:3000/api/usuarios";

export async function obtenerUsuarios() {
    const res = await fetch(API);

    if (!res.ok) {
        throw new Error("Error al obtener usuarios");
    }

    return await res.json();
}

export async function obtenerUsuario(id) {
    const res = await fetch(`${API}/${id}`);

    if (!res.ok) {
        throw new Error("Error al obtener el usuario");
    }

    return await res.json();
}

export async function crearUsuario(usuario) {
    const res = await fetch(API, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(usuario)
    });

    if (!res.ok) {
        throw new Error("Error al crear usuario");
    }

    return await res.json();
}

export async function actualizarUsuario(id, usuario) {
    const res = await fetch(`${API}/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(usuario)
    });

    if (!res.ok) {
        throw new Error("Error al actualizar usuario");
    }

    return await res.json();
}

export async function eliminarUsuario(id) {
    const res = await fetch(`${API}/${id}`, {
        method: "DELETE"
    });

    if (!res.ok) {
        throw new Error("Error al eliminar usuario");
    }

    return await res.json();
}