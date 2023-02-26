<template>
    <MglMap :accessToken="accessToken" :mapStyle="mapStyle" />
</template>
  
<script>
import Mapbox from "mapbox-gl";
import { MglMap } from "vue-mapbox";

export default {
    components: {
        MglMap
    },
    data() {
        return {
            accessToken: "pk.eyJ1IjoicGthbWxsZXkiLCJhIjoiY2xlbDNhb29rMHF6dTN5cW52a3o0djBiNiJ9.asCT8E1IbomZQ6NZIjK72Q", // your access token. Needed if you using Mapbox maps
            mapStyle: "mapbox://styles/mapbox/streets-v11" // your map style
        };
    },

    created() {
        // We need to set mapbox-gl library here in order to use it in template
        this.mapbox = Mapbox;
    }
};
</script>