
<template>

<h2>Bienvenido {{ usuario.nombre }}</h2>

<div class="menu">

    <RouterLink to="/materiales">
        Materiales
    </RouterLink>

    <RouterLink to="/categorias">
        Categorías
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