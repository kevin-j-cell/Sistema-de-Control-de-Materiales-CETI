<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";

import {
    obtenerMateriales,
    crearMaterial,
    actualizarMaterial,
    eliminarMaterial
} from "../services/materialService";

const router = useRouter();

const materiales = ref([]);

const categorias = [
    "Hardware",
    "Equipo electronico",
    "Libro o manual",
    "Equipo de red"
];

const mostrarFormulario = ref(false);

const modoEdicion = ref(false);

const idEditar = ref(null);

const nuevoMaterial = ref({
    nombre: "",
    descripcion: "",
    cantidad_total: 0,
    cantidad_disponible: 0,
    ubicacion: "",
    categoria: "Hardware",
    estado: true
});

async function cargarMateriales() {

    try {

        materiales.value = await obtenerMateriales();

    } catch (error) {

        console.error(error);

    }

}

function nuevo() {

    modoEdicion.value = false;

    idEditar.value = null;

    nuevoMaterial.value = {
        nombre: "",
        descripcion: "",
        cantidad_total: 0,
        cantidad_disponible: 0,
        ubicacion: "",
        categoria: "Hardware",
        estado: true
    };

    mostrarFormulario.value = true;

}

function editar(material) {

    modoEdicion.value = true;

    idEditar.value = material.id_material;

    nuevoMaterial.value = { ...material };

    mostrarFormulario.value = true;

}

async function guardarMaterial() {

    try {

        if (modoEdicion.value) {

            await actualizarMaterial(
                idEditar.value,
                nuevoMaterial.value
            );

        } else {

            await crearMaterial(
                nuevoMaterial.value
            );

        }

        await cargarMateriales();

        nuevoMaterial.value = {
            nombre: "",
            descripcion: "",
            cantidad_total: 0,
            cantidad_disponible: 0,
            ubicacion: "",
            categoria: "Hardware",
            estado: true
        };

        modoEdicion.value = false;

        idEditar.value = null;

        mostrarFormulario.value = false;

    } catch (error) {

        console.error(error);

        alert(error.message);

    }

}

async function eliminar(material) {

    if (!confirm(`¿Eliminar "${material.nombre}"?`)) {
        return;
    }

    try {

        await eliminarMaterial(
            material.id_material
        );

        await cargarMateriales();

    } catch (error) {

        console.error(error);

        alert(error.message);

    }

}

function volverInicio() {

    router.push("/home");

}

onMounted(() => {

    cargarMateriales();

});
</script>

<template>

    <div>

        <button @click="volverInicio">
            ← Volver al inicio
        </button>

        <h1>Materiales</h1>

        <button @click="nuevo()">
            Nuevo Material
        </button>

        <form
            v-if="mostrarFormulario"
            @submit.prevent="guardarMaterial"
        >

            <h2>
                {{ modoEdicion ? "Editar Material" : "Nuevo Material" }}
            </h2>

            <div>

                <label>Nombre</label><br>

                <input
                    v-model="nuevoMaterial.nombre"
                    required
                >

            </div>

            <div>

                <label>Descripción</label><br>

                <textarea
                    v-model="nuevoMaterial.descripcion"
                ></textarea>

            </div>

            <div>

                <label>Cantidad Total</label><br>

                <input
                    type="number"
                    min="0"
                    v-model.number="nuevoMaterial.cantidad_total"
                    required
                >

            </div>

            <div>

                <label>Cantidad Disponible</label><br>

                <input
                    type="number"
                    min="0"
                    v-model.number="nuevoMaterial.cantidad_disponible"
                    required
                >

            </div>

            <div>

                <label>Ubicación</label><br>

                <input
                    v-model="nuevoMaterial.ubicacion"
                >

            </div>

            <div>

                <label>Categoría</label><br>

                <select v-model="nuevoMaterial.categoria">

                    <option
                        v-for="categoria in categorias"
                        :key="categoria"
                        :value="categoria"
                    >
                        {{ categoria }}
                    </option>

                </select>

            </div>

            <div>

                <label>

                    <input
                        type="checkbox"
                        v-model="nuevoMaterial.estado"
                    >

                    Activo

                </label>

            </div>

            <br>

            <button type="submit">

                {{ modoEdicion ? "Actualizar Material" : "Guardar Material" }}

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
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Total</th>
                    <th>Disponible</th>
                    <th>Ubicación</th>
                    <th>Categoría</th>
                    <th>Estado</th>
                    <th>Acciones</th>

                </tr>

            </thead>

            <tbody>

                <tr
                    v-for="material in materiales"
                    :key="material.id_material"
                >

                    <td>{{ material.id_material }}</td>

                    <td>{{ material.nombre }}</td>

                    <td>{{ material.descripcion }}</td>

                    <td>{{ material.cantidad_total }}</td>

                    <td>{{ material.cantidad_disponible }}</td>

                    <td>{{ material.ubicacion }}</td>

                    <td>{{ material.categoria }}</td>

                    <td>

                        {{ material.estado ? "Activo" : "Inactivo" }}

                    </td>

                    <td>

                        <button
                            @click="editar(material)"
                        >

                            Editar

                        </button>

                        <button
                            @click="eliminar(material)"
                        >

                            Eliminar

                        </button>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</template>

<style scoped>

table{

    width:100%;
    border-collapse:collapse;

}

th,td{

    padding:8px;
    text-align:left;

}

form{

    margin:20px 0;
    padding:15px;
    border:1px solid #ccc;

}

input,
textarea,
select{

    width:100%;
    margin-bottom:10px;

}

button{

    margin-right:10px;

}

</style>