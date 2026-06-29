const API = "http://localhost:3000/api/materiales";

export async function obtenerMateriales() {

    const res = await fetch(API);

    if (!res.ok) {
        throw new Error("Error al obtener los materiales");
    }

    return await res.json();
}

export async function obtenerMaterial(id) {

    const res = await fetch(`${API}/${id}`);

    if (!res.ok) {
        throw new Error("Error al obtener el material");
    }

    return await res.json();
}

export async function crearMaterial(material) {

    const res = await fetch(API, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(material)
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al crear el material");
    }

    return data;
}

export async function actualizarMaterial(id, material) {

    const res = await fetch(`${API}/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(material)
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al actualizar el material");
    }

    return data;
}

export async function eliminarMaterial(id) {

    const res = await fetch(`${API}/${id}`, {
        method: "DELETE"
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al eliminar el material");
    }

    return data;
}