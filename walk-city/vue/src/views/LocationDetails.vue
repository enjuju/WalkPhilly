<template>
  <div class="main">
    <div id="location-card">
      <h2 id="location-name">{{ location.locationName }}</h2>
      <div class="cooler-line"></div>
      <img id="location-image" :src="`https://walk-philly.fly.dev/api/photos/Philadelphia ${locationObject.locationName}`"
        alt="" />
      <div id="location-buttons">
        <button class="btn-darker-midnight-green" @click="
          checkIn({
            userId: $store.state.user.id,
            locationId: location.locationId
          })
        ">
          CHECK-IN
        </button>
        <button class="btn-darker-midnight-green" @click.prevent="
          setLocation({ lat: location.latitude, lng: location.longitude })
        ">
          DIRECTIONS
        </button>
      </div>
      <div class="alert alert-success" role="alert" v-show="isCheckedIn">
        Check-in successful!
      </div>
      <div id="location-description">
        <p id="description">{{ location.description }}</p>
        <p id="availability">{{ location.availability }}</p>
        <p>
          <a v-bind:href="location.social" target="_blank">{{
            location.social
          }}</a>
        </p>
      </div>
      <img @click="goBack" id="back-button" src="../assets/back-arrow.png" />
    </div>
  </div>
</template>

<script>
import checkInService from "../services/CheckInService";
import locationService from "../services/LocationService";
export default {
  name: "location-details",
  components: {},
  props: ["checkInId"],
  data() {
    return {
      location: {},
      isCheckedIn: false
    };
  },
  created() {
    locationService.getLocationById(this.$route.params.id).then((response) => {
      this.location = response.data;
    });
  },
  computed: {},
  methods: {
    goBack() {
      this.$router.back(1);
    },
    setLocation(location) {
      this.$router.push({ name: "home-view", query: { dir: true } });
      this.$store.commit("SET_END_LOCATION", location);
    },
    checkIn(checkIn) {
      checkInService.createCheckin(checkIn).then((response) => {
        if (response.status === 200 || response.status === 201) {
          // success code here
          this.isCheckedIn = true;
        }
      });
    },
  },
};
</script>

<style src="../components/locationdetail/locationDetail.css" scoped />
