import { createRouter, createWebHistory } from "vue-router";

import LoginView from "../views/LoginView.vue";
import HomeView from "../views/HomeView.vue";
import MaterialesView from "../views/MaterialesView.vue";
import UsuariosView from "../views/UsuariosView.vue";
import CategoriasView from "../views/CategoriasView.vue";
import PrestamosView from "../views/PrestamosView.vue";

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
        path: "/usuarios",
        name: "usuarios",
        component: UsuariosView,
        meta:{
            requiereAdmin:true
        }
    },
    {
        path: "/categorias",
        component: CategoriasView
    },
    {
        path: "/prestamos",
        component: PrestamosView
    },
    {
        path: "/materiales",
        component: MaterialesView
    },



];

const router = createRouter({

    history: createWebHistory(),
    routes

});

router.beforeEach((to, from, next)=>{

    const usuario = JSON.parse(localStorage.getItem("usuario"));

    if(!usuario && to.path != "/"){
        return next("/");
    }

    if(
        to.meta.requiereAdmin &&
        usuario.tipo !== "Administrador"
        
    ){

        return next("/home");
    }

    next();

});

export default router;