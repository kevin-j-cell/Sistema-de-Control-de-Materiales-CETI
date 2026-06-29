<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";

import {
    obtenerPrestamos,
    crearPrestamo,
    actualizarPrestamo,
    eliminarPrestamo
} from "../services/prestamosService";

const router = useRouter();

const prestamos = ref([]);

const mostrarFormulario = ref(false);

const modoEdicion = ref(false);

const idEditar = ref(null);

const nuevoPrestamo = ref({
    id_usuario_encargado: "",
    matricula: "",
    nombre_solicitante: "",
    fecha_solicitud: "",
    fecha_entrega: "",
    estado: "Pendiente",
    observaciones: ""
});

async function cargarPrestamos() {

    try {

        prestamos.value = await obtenerPrestamos();

    } catch (error) {

        console.error(error);

    }

}

function nuevo() {

    modoEdicion.value = false;

    idEditar.value = null;

    nuevoPrestamo.value = {
        id_usuario_encargado: "",
        matricula: "",
        nombre_solicitante: "",
        fecha_solicitud: "",
        fecha_entrega: "",
        estado: "Pendiente",
        observaciones: ""
    };

    mostrarFormulario.value = true;

}

function editar(prestamo) {

    modoEdicion.value = true;

    idEditar.value = prestamo.id_prestamo;

    nuevoPrestamo.value = { ...prestamo };

    mostrarFormulario.value = true;

}

async function guardarPrestamo() {

    try {

        const usuario = JSON.parse(localStorage.getItem("usuario"));

        nuevoPrestamo.value.id_usuario_encargado = usuario.id;

        if (modoEdicion.value) {

            await actualizarPrestamo(
                idEditar.value,
                nuevoPrestamo.value
            );

        } else {

            await crearPrestamo(
                nuevoPrestamo.value
            );

        }

        await cargarPrestamos();

        nuevoPrestamo.value = {
            id_usuario_encargado: "",
            matricula: "",
            nombre_solicitante: "",
            fecha_solicitud: "",
            fecha_entrega: "",
            estado: "Pendiente",
            observaciones: ""
        };

        modoEdicion.value = false;
        idEditar.value = null;
        mostrarFormulario.value = false;

    } catch (error) {

        console.error(error);
        alert(error.message);

    }

}

async function eliminar(prestamo) {

    if (!confirm(`¿Eliminar el préstamo #${prestamo.id_prestamo}?`)) {

        return;

    }

    try {

        await eliminarPrestamo(
            prestamo.id_prestamo
        );

        await cargarPrestamos();

    } catch (error) {

        console.error(error);

        alert(error.message);

    }

}

function verDetalles(prestamo) {

    router.push(`/prestamos/${prestamo.id_prestamo}/detalles`);

}

function marcarComoEntregado(prestamo) {

    alert("Esta funcionalidad se implementará después.");

}

function volverInicio() {

    router.push("/home");

}

onMounted(() => {

    cargarPrestamos();

});
</script>

<template>

    <div>

        <button @click="volverInicio">
            ← Volver al inicio
        </button>

        <h1>Préstamos</h1>

        <button @click="nuevo()">
            Nuevo Préstamo
        </button>

        <form
            v-if="mostrarFormulario"
            @submit.prevent="guardarPrestamo"
        >

            <h2>

                {{ modoEdicion ? "Editar Préstamo" : "Nuevo Préstamo" }}

            </h2>



            <div>

                <label>Matrícula</label><br>

                <input
                    v-model="nuevoPrestamo.matricula"
                    required
                >

            </div>

            <div>

                <label>Nombre del Solicitante</label><br>

                <input
                    v-model="nuevoPrestamo.nombre_solicitante"
                    required
                >

            </div>

            <div>

                <label>Fecha Solicitud</label><br>

                <input
                    type="date"
                    v-model="nuevoPrestamo.fecha_solicitud"
                    required
                >

            </div>

            <div>

                <label>Fecha Entrega</label><br>

                <input
                    type="date"
                    v-model="nuevoPrestamo.fecha_entrega"
                >

            </div>

            <div>

                <label>Observaciones</label><br>

                <textarea
                    v-model="nuevoPrestamo.observaciones"
                ></textarea>

            </div>

            <br>

            <button type="submit">

                {{ modoEdicion ? "Actualizar Préstamo" : "Guardar Préstamo" }}

            </button>

            <button
                type="button"
                @click="mostrarFormulario = false"
            >

                Cancelar

            </button>

        </form>

        <br>

        <table border="1">

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Encargado</th>
                    <th>Matrícula</th>
                    <th>Solicitante</th>
                    <th>Fecha Solicitud</th>
                    <th>Fecha Entrega</th>
                    <th>Estado</th>
                    <th>Acciones</th>

                </tr>

            </thead>

            <tbody>

                <tr
                    v-for="prestamo in prestamos"
                    :key="prestamo.id_prestamo"
                >

                    <td>{{ prestamo.id_prestamo }}</td>

                    <td>{{ prestamo.usuario_encargado }}</td>

                    <td>{{ prestamo.matricula }}</td>

                    <td>{{ prestamo.nombre_solicitante }}</td>

                    <td>{{ prestamo.fecha_solicitud }}</td>

                    <td>{{ prestamo.fecha_entrega || "-" }}</td>

                    <td>{{ prestamo.estado }}</td>

                    <td>

                        <button
                            @click="editar(prestamo)"
                        >

                            Editar

                        </button>

                        <button
                            @click="eliminar(prestamo)"
                        >

                            Eliminar

                        </button>

                        <button
                            @click="verDetalles(prestamo)"
                        >

                            Detalles

                        </button>

                        <button
                            @click="marcarComoEntregado(prestamo)"
                            :disabled="prestamo.estado === 'Entregado'"
                        >

                            Marcar como entregado

                        </button>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</template>