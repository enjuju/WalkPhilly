import axios from "axios";

export default {
    getBadgesByUserId(userId) {
        if (userId == undefined)
            {return ;}
        else{
            return axios.get(`/badges/user/${userId}`);
        }
    },

    getBadgesByBadgeId(badgeId) {
          return axios.get(`/badges/badge/${badgeId}`);
    },

    getAllBadges() {
        return axios.get("/badges/all");
    }

}