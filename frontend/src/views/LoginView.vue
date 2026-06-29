<template>

<div class="login">
    <h2>Control de materiales del CETI</h2>
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

        localStorage.setItem(
            "usuario",
            JSON.stringify(datos.usuario)
        );


        
        router.push("/home");
        //localStorage.removeItem("usuario");

    }
    catch (error) {

        mensaje.value = "No se pudo conectar con el servidor";

    }

}



</script>

<style scoped>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
}

.login {
    width: 350px;
    margin: 100px auto;
    padding: 30px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    display: flex;
    flex-direction: column;
    gap: 15px;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 10px;
}

input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 16px;
    outline: none;
}

input:focus {
    border-color: #1976d2;
}

button {
    padding: 10px;
    border: none;
    border-radius: 6px;
    background: #1976d2;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background .2s;
}

button:hover {
    background: #1565c0;
}

p {
    text-align: center;
    color: #d32f2f;
    min-height: 20px;
}

body {
    background: #f4f6f9;
}

</style>