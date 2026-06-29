
<template>

<h2>Bienvenido {{ usuario.nombre }}</h2>

<div class="menu">

    <RouterLink to="/materiales">
        Materiales
    </RouterLink>


    <RouterLink to="/prestamos">
        Préstamos
    </RouterLink>

    <RouterLink
        v-if="usuario.tipo === 'Administrador'"
        to="/usuarios">

        Usuarios

    </RouterLink>

    <button @click="cerrarSesion">
    Cerrar sesión
    </button>

</div>

</template>


<script setup>
    import { useRouter } from "vue-router";
    const usuario = JSON.parse(localStorage.getItem("usuario"));
    

    const router = useRouter();

    const cerrarSesion = () => {

        localStorage.removeItem("usuario");

        router.push("/");

    }


</script>

<style scoped>

* {
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

h2 {
    text-align: center;
    color: #333;
    margin: 40px 0 30px;
}

.menu {
    width: 350px;
    margin: auto;
    padding: 30px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,.15);

    display: flex;
    flex-direction: column;
    gap: 15px;
}

a {
    text-decoration: none;
    text-align: center;
    padding: 12px;
    background: #1976d2;
    color: white;
    border-radius: 6px;
    transition: background .2s;
}

a:hover {
    background: #1565c0;
}

button {
    padding: 12px;
    border: none;
    border-radius: 6px;
    background: #d32f2f;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background .2s;
}

button:hover {
    background: #b71c1c;
}

</style>