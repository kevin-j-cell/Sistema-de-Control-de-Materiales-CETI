const API = "http://localhost:3000/api/prestamos";

export async function obtenerPrestamos() {

    const res = await fetch(API);

    if (!res.ok) {
        throw new Error("Error al obtener los préstamos");
    }

    return await res.json();
}

export async function obtenerPrestamo(id) {

    const res = await fetch(`${API}/${id}`);

    if (!res.ok) {
        throw new Error("Error al obtener el préstamo");
    }

    return await res.json();
}

export async function crearPrestamo(prestamo) {

    const res = await fetch(API, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(prestamo)
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al crear el préstamo");
    }

    return data;
}

export async function actualizarPrestamo(id, prestamo) {

    const res = await fetch(`${API}/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(prestamo)
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al actualizar el préstamo");
    }

    return data;
}

export async function eliminarPrestamo(id) {

    const res = await fetch(`${API}/${id}`, {
        method: "DELETE"
    });

    const data = await res.json();

    if (!res.ok) {
        throw new Error(data.mensaje || "Error al eliminar el préstamo");
    }

    return data;
}