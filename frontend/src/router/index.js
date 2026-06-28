import { createRouter, createWebHistory } from "vue-router";

import LoginView from "../views/LoginView.vue";
import HomeView from "../views/HomeView.vue";
import ProductosView from "../views/ProductosView.vue";
import UsuariosView from "../views/UsuariosView.vue";

const routes = [

    {
        path: "/",
        name: "login",
        component: LoginView
    },

    {
        path: "/home",
        name: "home",
        component: HomeView
    },

    {
        path: "/productos",
        name: "productos",
        component: ProductosView
    },

    {
        path: "/usuarios",
        name: "usuarios",
        component: UsuariosView
    }

];

const router = createRouter({

    history: createWebHistory(),
    routes

});

export default router;