<template>
  <div class="home">
    <GmapMap :center="$store.state.userPos" :zoom="15" :options="{
      zoomControl: false,
      mapTypeControl: false,
      scaleControl: false,
      streetViewControl: false,
      rotateControl: false,
      fullscreenControl: false,
      disableDefaultUi: false,
      mapId: '5bad73ddd2112653'
    }" map-type-id="roadmap" style="width: 100%; height: 93%" @click="closeMenuView">
      <GmapMarker :key="index" v-for="(m, index) in $store.state.filteredMarkers" :ref="`marker${index}`"
        :position="m.position" :icon="
          `https://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=${index +
          1}|FF0000|FFFFFF`
        " :clickable="true" :draggable="false" @click="openMarker(index)">
        <GmapInfoWindow class="info-window" :closeclick="true" @closeclick="openMarker(null)"
          :opened="openMarkerId === index">
          <div id="body">
            <!-- <router-link
              :to="{ name: 'location-details', params: { id: m.id } }"
            > -->
            <location-details-modal :location="m"></location-details-modal>
            <div id="location-name" @click="openLocationDetails(m.id)">{{ m.name }}</div>
            <!-- </router-link> -->

            <div id="location-address">{{ m.address }}</div>

            <img id="location-img" :src="`https://walk-philly.fly.dev/api/photos/Philadelphia ${m.name}`" alt="" />
            <div id="location-buttons">
              <div id="directions">
                <div class="dropdown-container">
                  <b-form-select v-model="travelMode" :options="options" @change="setTravelMode"></b-form-select>
                </div>
                <button class="btn-midnight-green" :class="{ active: isDirectionsShowing }"
                  @click="showDirections(m.position)">
                  DIRECTIONS
                </button>
              </div>
              <button class="btn-midnight-green" @click="
                checkIn(
                  {
                    userId: $store.state.user.id,
                    locationId: m.id,
                    isCheckedIn: true
                  },
                  m.position,
                  m.category
                )
              " :disabled="m.isCheckedIn && isLoggedIn" :class="{ guest: !isLoggedIn }">
                {{ m.isCheckedIn && isLoggedIn ? "CHECKED-IN" : "CHECK-IN" }}
              </button>

              <!-- <div>
                <b-button 
                variant="success"
                @click="checkIn() === true">
                New Badge - Send true

                </b-button>
              </div> -->

              <div id="check-in-far" class="alert alert-danger" role="alert"
                v-show="m.isTooFar && !isHidden && isLoggedIn" @click="hideAlert && toggleTooFar(m.id)">
                You're too far from this location!
              </div>
              <div id="not-logged-in" class="alert alert-danger" role="alert" v-show="!isLoggedIn">
                You need to be logged in to use this feature.

              </div>
            </div>
          </div>
        </GmapInfoWindow>
      </GmapMarker>
      <GmapMarker :position="this.$store.state.userPos" :icon="require('../assets/user-location_50-1.png')"></GmapMarker>
      <DirectionsRenderer :travelMode="travelMode" :origin="startLocation" :destination="endLocation" />
    </GmapMap>
    <new-badge-modal></new-badge-modal>
    <Navigation-Modal></Navigation-Modal>
    <filter-results></filter-results>
    <menu-button v-show="$store.state.isMenuButtonShowing"></menu-button>
    <Transition name="slide">
      <menu-view v-show="$store.state.isMenuViewShowing"></menu-view>
    </Transition>
  </div>
</template>

<script>
import MenuButton from "../components/MenuButton.vue";
import MenuView from "../components/MenuView.vue";
import LocationService from "../services/LocationService";
import FilterResults from "../components/FilterResults.vue";
import DirectionsRenderer from "../components/DirectionsRenderer.js";
import CheckInService from "../services/CheckInService";
import badgesServices from "../services/BadgesService";
import NewBadgeModal from "../components/NewBadgeModal.vue";
import LocationDetailsModal from "../components/locationdetail/LocationDetailsModal.vue"
import NavigationModal from "../components/NavigationModal.vue";
import { mapGetters } from "vuex";


export default {
  name: "home-view",
  methods: {
    closeMenuView() {
      if (this.$store.state.isMenuViewShowing) {
        this.$store.commit("MENU_TOGGLE");
      }
    },
    // geolocate: function () {
    //   navigator.geolocation.getCurrentPosition(position => {
    //     this.userPos = {
    //       lat: position.coords.latitude,
    //       lng: position.coords.longitude
    //     };
    //     this.$store.commit("SET_USER_POSITION", this.userPos);
    //   });
    //},
    openMarker(id) {
      this.openMarkerId = id;
      this.isCheckedIn = false;
    },
    setPlace(place) {
      this.currentPlace = place;
    },
    showDirections(destination) {
      this.toggleDirections();
      this.startLocation = this.userPos;
      this.endLocation = destination;
    },
    setTravelMode(travelMode) {
      this.travelMode = travelMode;
    },
    toggleDirections() {
      const dir = this.$route.query.dir;
      if (dir == "true" || dir == true) {
        this.$router.push({ name: "home-view", query: { dir: false } });
      } else {
        this.$router.push({ name: "home-view", query: { dir: true } });
      }
      this.isDirectionsShowing = !dir;
    },
    checkIn(checkIn, locationPos, category) {

      // check if user is within location range
      if (this.isLoggedIn && this.checkUserDistance(locationPos, category)) {
        CheckInService.createCheckin(checkIn).then(response => {
          if (response.status === 200 || response.status === 201) {
            // success code here
            this.$store.commit("CHECK_IN", checkIn.locationId);

          }
          if (response.data === true) {
            console.log("Nice, new badge.");
            this.$bvModal.show("new-badge-modal");
          }
        });
      } else {
        this.$store.commit("SET_IS_TOO_FAR", checkIn.locationId);
      }
    },
    checkUserDistance(locationPos, category) {
      // 1 km = ~0.01 degrees
      // average Philadelphia park size = 0.0145687 kms
      const parkRange = 0.0015;
      const range = 0.001;
      const isParkLatNear =
        locationPos.lat - this.$store.state.userPos.lat <= parkRange &&
        locationPos.lat - this.$store.state.userPos.lat >= -parkRange;
      const isParkLngNear =
        locationPos.lng - this.$store.state.userPos.lng <= parkRange &&
        locationPos.lng - this.$store.state.userPos.lng >= -parkRange;

      const isLatNear =
        locationPos.lat - this.$store.state.userPos.lat <= range &&
        locationPos.lat - this.$store.state.userPos.lat >= -range;
      const isLngNear =
        locationPos.lng - this.$store.state.userPos.lng <= range &&
        locationPos.lng - this.$store.state.userPos.lng >= -range;

      const isInParkRange =
        category.includes("Park") && isParkLatNear && isParkLngNear;
      const isInRange = !category.includes("Park") && isLatNear && isLngNear;

      return isInParkRange || isInRange;
    },
    hideAlert() {
      this.isHidden = !this.isHidden;
    },
    toggleTooFar(locationId) {
      this.$store.commit("SET_IS_NOT_TOO_FAR", locationId)
    },
    openLocationDetails(id) {
      this.$bvModal.show("location-details-modal-" + id);
    },
    checkUserInPhilly() {
      if (this.$store.state.userPos.lat == 39.95275472505483 && this.$store.state.userPos.lng == -75.1635208523996) {
        this.isInPhilly = true;
      }
      else { this.isInPhilly = false; }
    },
  },
  components: {
    MenuButton,
    MenuView,
    FilterResults,
    DirectionsRenderer,
    NewBadgeModal,
    LocationDetailsModal,
    NavigationModal
  },
  data() {
    return {
      // userPos: {
      //   lat: 0,
      //   lng: 0
      // },
      isInPhilly: null,
      openMarkerId: null,
      startLocation: this.$store.state.userPos,
      endLocation: this.$store.state.endLocation,
      currentPlace: null,
      travelMode: "WALKING",
      options: [
        { value: "WALKING", text: "Walk" },
        { value: "TRANSIT", text: "Transit" }
      ],
      isDirectionsShowing: false,
      placeImage: null,
      currentLocationId: 0,
      currentUserId: this.$store.state.user.id,
      isCheckedIn: false,
      checkedInLocations: [],
      isHidden: false,
      isLoggedIn: this.$store.state.token != '',
    };
  },
  mounted() {
    // this.geolocate();
    this.checkUserInPhilly();
    if (!this.isInPhilly) {
      this.$bvModal.show("navigation-modal");
    }

  },
  created() {
    // get data from API
    LocationService.getAllLocations().then(response => {
      this.$store.commit("LOAD_LOCATIONS", response.data);
      this.$store.commit("LOAD_NEARBY_LOCATIONS");
    });
    // set marker check-ins to API value
    if (this.$store.state.user.id != undefined) {
      CheckInService.getCheckInsByUserId(this.$store.state.user.id).then(response => {
        this.$store.commit("SET_CHECK_IN_STATUS", response.data);
      });
    }
    if (this.$store.state.user.id != undefined) {
      badgesServices
        .getBadgesByUserId(this.$store.state.user.id)
        .then(response => {
          this.$store.commit("SET_USER_BADGE_LIST", response.data);
        });
    }
  },
  computed: {
    ...mapGetters(['getUserPos']),
    userPos() {
      return this.getUserPos;
    }
  }
}
</script>

<style>
.home {
  height: 100%;
}

#location-name {
  font-weight: bold;
  color: rgb(0, 73, 83);
  font-size: 24px;
}

#location-address {
  color: rgb(0, 73, 83);
}

#body {
  display: grid;
  padding: 20px;
  text-align: center;
  place-content: center;
  justify-content: center;
}

#location-img {
  object-fit: cover;
  margin: auto;
  padding: 10px;
  left: -1000%;
  right: -1000%;
  top: -1000%;
  bottom: -1000%;
  width: 200px;
  height: 200px;
}

#location-buttons {
  display: flex;
  gap: 10px;
  flex-direction: column;
  align-items: center;
  flex-shrink: 2;
}

#directions {
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items: center;
}

button.active {
  background-color: rgb(0, 73, 83);
  color: white;
}

button:disabled {
  background-color: rgb(0, 73, 83);
  color: white;

}

button.guest {
  opacity: 50%
}
</style>
