<template>
  <div class="navigation-modal-container">
    <b-modal id="navigation-modal" hide-footer hide-header centered text-center no-close-on-backdrop no-close-on-esc>

      <div id="navigation-modal-details">
        <h2>Welcome!</h2>
        <div class="cool-line"></div>
        <div id="image-badge">
          <img src="../assets/llamawhite.png">
        </div>
        <h6 id="navigation-desc">This application requires you to be in Philadelphia and is designed for mobile.
        </h6>
        <button class="btn-darker-midnight-green" @click="teleport(), reloadLocations(), closeModal()">TELEPORT
          ME</button>
      </div>
    </b-modal>
  </div>
</template>

<script>
import LocationService from '../services/LocationService';
export default {

  data() {
    return {
      userPos: {
        lat: 39.95275472505483,
        lng: -75.1635208523996,
      }
    }
  },
  methods: {
    teleport() {
      this.$store.commit("SET_USER_POSITION", this.userPos);
      // if (this.$refs.googleMap) {
      //   this.$refs.mapRef.$mapPromise.then((map) => {
      //     map.panTo(this.userPos)
      //   })
      // }
    },
    reloadLocations() {
      LocationService.getAllLocations().then(response => {
        this.$store.commit("LOAD_LOCATIONS", response.data);
        this.$store.commit("LOAD_NEARBY_LOCATIONS");
      })
    },
    closeModal() {
      this.$bvModal.hide('navigation-modal');
    }
  }
}
</script>

<style scoped>
.modal-content {
  background: rgba(23, 19, 19, 0.25) !important;
  backdrop-filter: blur(15px) !important;
  border-radius: 40px !important;
  color: white;
  margin: 1rem;
}

.modal-backdrop {
  opacity: 0.25 !important;
}

.modal-header {
  text-align: center !important;
}

h2 {
  padding-top: .5rem;
}


#navigation-modal-details {
  text-align: center;
  display: flex;
  justify-content: center;
  flex-direction: column;
  /* margin: 1rem; */
  align-items: center;
}

#image-badge {
  margin-top: 1rem;

}

/* #navigation-desc {
  margin-bottom: 1rem;
} */
</style>