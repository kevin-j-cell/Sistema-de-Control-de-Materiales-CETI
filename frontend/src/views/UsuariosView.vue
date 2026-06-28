<script setup>
import { ref, onMounted } from "vue";
import { obtenerUsuarios, crearUsuario, actualizarUsuario, eliminarUsuario } from "../services/usuarioService";
import { useRouter } from "vue-router";

const usuarios = ref([]);
const mostrarFormulario = ref(false);
const modoEdicion = ref(false);
const idEditar = ref(null);
const router = useRouter();

const nuevoUsuario = ref({
    nombre: "",
    apellido: "",
    usuario: "",
    password: "",
    tipo: "Encargado",
    estado: true
});

async function cargarUsuarios() {
    try {
        usuarios.value = await obtenerUsuarios();
    } catch (error) {
        console.error(error);
    }
}

async function guardarUsuario() {
    try {

        if (modoEdicion.value) {

            await actualizarUsuario(
                idEditar.value,
                nuevoUsuario.value
            );
        } else {
            await crearUsuario(nuevoUsuario.value);
        }

        nuevoUsuario.value = {
            nombre: "",
            apellido: "",
            usuario: "",
            password: "",
            tipo: "Encargado",
            estado: true
        };

        modoEdicion.value = false;

        idEditar.value = null;

        mostrarFormulario.value = false;

        await cargarUsuarios();

    } catch (error) {
        console.error(error);
    }
}

function editar(usuario) {

    modoEdicion.value = true;

    idEditar.value = usuario.id_usuario;

    nuevoUsuario.value = { ...usuario };

    mostrarFormulario.value = true;

}

function nuevo() {

    modoEdicion.value = false;

    idEditar.value = null;

    nuevoUsuario.value = {
        nombre: "",
        apellido: "",
        usuario: "",
        password: "",
        tipo: "Encargado",
        estado: true
    };

    mostrarFormulario.value = true;

}

async function eliminar(usuario) {

    if (!confirm(`¿Deseas eliminar al usuario ${usuario.usuario}?`)) {
        return;
    }

    try {

        await eliminarUsuario(usuario.id_usuario);

        await cargarUsuarios();

    } catch (error) {

        console.error(error);

        alert(error.message);

    }

}

function volverInicio() {
    router.push("/home");
}

onMounted(() => {
    cargarUsuarios();
});
</script>

<template>
    <div>
        
        <button @click="volverInicio">
            ← Volver al inicio
        </button>

        <h1>Usuarios</h1>

        <button @click="nuevo()">
            Nuevo Usuario
        </button>

        <form v-if="mostrarFormulario" @submit.prevent="guardarUsuario">

            <div>
                <label>Nombre</label><br>
                <input
                    v-model="nuevoUsuario.nombre"
                    required
                >
            </div>

            <div>
                <label>Apellido</label><br>
                <input
                    v-model="nuevoUsuario.apellido"
                >
            </div>

            <div>
                <label>Usuario</label><br>
                <input
                    v-model="nuevoUsuario.usuario"
                    required
                >
            </div>

            <div>
                <label>Contraseña</label><br>
                <input
                    type="password"
                    v-model="nuevoUsuario.password"
                    required
                >
            </div>

            <div>
                <label>Tipo</label><br>

                <select v-model="nuevoUsuario.tipo">

                <option value="Administrador">
                Administrador
                </option>

                <option value="Encargado">
                Encargado
                </option>

                </select>

            </div>

            <div>

                <label>

                    <input
                    type="checkbox"
                    v-model="nuevoUsuario.estado"
                    >

                    Activo

                </label>

            </div>

            <button type="submit">
                {{ modoEdicion ? "Actualizar Usuario" : "Guardar Usuario" }}
            </button>

            <button
                type="button"
                @click="mostrarFormulario = false"
            >
                Cancelar
            </button>

        </form>

<hr>          

        <table border="1" cellpadding="5">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <tbody>
                <tr
                    v-for="usuario in usuarios"
                    :key="usuario.id_usuario"
                >
                    <td>{{ usuario.id_usuario }}</td>
                    <td>{{ usuario.nombre }}</td>
                    <td>{{ usuario.apellido }}</td>
                    <td>{{ usuario.usuario }}</td>
                    <td>{{ usuario.tipo }}</td>
                    <td>{{ usuario.estado ? "Activo" : "Inactivo" }}</td>

                    <td>
                        <button @click="editar(usuario)" :disabled="usuario.usuario === 'kevin'">
                            Editar
                        </button>

                        <button
                            @click="eliminar(usuario)"
                            :disabled="usuario.usuario === 'kevin'"
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
    border-collapse: collapse;
}

th,td{
    padding:8px;
    text-align:left;
}

</style>