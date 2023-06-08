import Vue from "vue";
import Router from "vue-router";
import HomeView from "../views/HomeView.vue";
import LoginView from "../views/LoginView.vue";
import LogoutView from "../views/LogoutView.vue";
import RegisterView from "../views/RegisterView.vue";
import store from "../store/index";
import LocationList from "../views/LocationList.vue";
import LocationDetails from "../views/LocationDetails.vue";
import HistoryView from "../views/HistoryView.vue"
import AboutUs from "../views/AboutUs.vue"
import MapBoxView from "../views/MapBoxView"

Vue.use(Router);

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "home-view",
      component: HomeView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login-view",
      component: LoginView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout-view",
      component: LogoutView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register-view",
      component: RegisterView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/locations",
      name: "location-list",
      component: LocationList,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: `/locations/:id`,
      name: "location-details",
      component: LocationDetails,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/history-view",
      name: "history-view",
      component: HistoryView,
      meta: {
        requiresAuth: true
      }  
    },
    {
      path: '/team-llama-drama',
      name: "about-us",
      component: AboutUs,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/mapbox/',
      name: "map-box-view",
      component: MapBoxView,
      meta: {
        requiresAuth: false
      }
    }
  ]
});

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === "") {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
