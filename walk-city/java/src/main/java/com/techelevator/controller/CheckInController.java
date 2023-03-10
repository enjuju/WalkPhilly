package com.techelevator.controller;

import com.techelevator.dao.CheckInDao;
import com.techelevator.dao.UserCheckInCategoryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.CheckIn;
import com.techelevator.model.UserCheckInCategory;
import com.techelevator.services.BadgeService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping
public class CheckInController
{
    private CheckInDao checkInDao;
    private UserCheckInCategoryDao userCheckInCategoryDao;
    private BadgeService badgeService;
    private UserDao userDao;

    public CheckInController(CheckInDao checkInDao, UserCheckInCategoryDao userCheckInCategoryDao, BadgeService badgeService, UserDao userDao) {
        this.checkInDao = checkInDao;
        this.userCheckInCategoryDao = userCheckInCategoryDao;
        this.badgeService = badgeService;
        this.userDao = userDao;
    }

    @GetMapping("/checkins")
    public List<CheckIn> getCheckIns() {return checkInDao.findAll(); }

    @GetMapping("/checkins/checkin/{checkInId}")
    public CheckIn getCheckInById(@PathVariable int checkInId) {
        CheckIn checkIn = checkInDao.getCheckInById(checkInId);
        return checkIn;
    }

    @GetMapping("/checkins/user/{userId}/location/{locationId}")
    public List<CheckIn> getCheckInByUserIdAndLocationId(@PathVariable int userId, Integer locationId) {
        List<CheckIn> checkIns = checkInDao.findCheckInByUserAndLocation(userId, locationId);
        return checkIns;
    }

    @RequestMapping(value = "/checkin", method = RequestMethod.POST)
    public boolean add(@Valid @RequestBody CheckIn checkIn, Principal principal) {
        int userId = userDao.findByUsername(principal.getName()).getId().intValue();
        checkInDao.create(checkIn);
        return badgeService.checkForNewBadge(userId); //returns boolean if needed for front-end
    }

    @GetMapping("/checkins/user/{userId}")
    public List<CheckIn> getCheckInsByUserId(@PathVariable int userId) {
        List<CheckIn> checkIns = checkInDao.findAllCheckInsByUserId(userId);
        return checkIns;
    }

    @GetMapping("/checkins/category/user/{userId}")
    public List<UserCheckInCategory> getCategoryCheckInsByUserId(@PathVariable int userId){
        List<UserCheckInCategory> checkIns = userCheckInCategoryDao.listAll(userId);
        return checkIns;
    }
}
