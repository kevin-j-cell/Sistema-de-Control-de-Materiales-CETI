<template>

<div class="login">

    <h2>Iniciar Sesión</h2>

    <input
        type="text"
        placeholder="Usuario"
        v-model="usuario"
    >

    <input
        type="password"
        placeholder="Contraseña"
        v-model="password"
    >

    <button @click="login">
        Ingresar
    </button>

    <p>{{ mensaje }}</p>

</div>

</template>

<script setup>



import { useRouter } from "vue-router";
import { ref } from "vue";

const usuario = ref("");
const password = ref("");
const mensaje = ref("");
const router = useRouter();

const login = async () => {

    try {

        const respuesta = await fetch("http://localhost:3000/api/login", {

            method: "POST",

            headers: {
                "Content-Type": "application/json"
            },

            body: JSON.stringify({

                usuario: usuario.value,
                password: password.value

            })

        });

        const datos = await respuesta.json();

        if (!respuesta.ok) {

            mensaje.value = datos.mensaje;
            return;

        }

        mensaje.value = datos.mensaje;

        console.log(datos.usuario);
        router.push("/home");

    }
    catch (error) {

        mensaje.value = "No se pudo conectar con el servidor";

    }

}



</script>