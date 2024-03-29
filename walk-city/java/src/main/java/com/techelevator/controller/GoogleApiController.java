package com.techelevator.controller;

import com.techelevator.model.PlacesSearchResponse;
import com.techelevator.services.PhotosService;
import com.techelevator.services.PlacesService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;


import java.awt.*;


@CrossOrigin

@RestController
@RequestMapping ("/api/photos")
public class GoogleApiController {
    private PhotosService photosService;
    private PlacesService placesService;

    @Value("${API_KEY}")
    private String API_KEY;

    public GoogleApiController() {
        this.photosService = new PhotosService();
        this.placesService = new PlacesService();
    }

    @GetMapping(value = "/{address}", produces = MediaType.IMAGE_JPEG_VALUE)
    public @ResponseBody
    byte[] getImage(@PathVariable String address) {
        String photoReference = placesService.getPhotoReference(address, API_KEY);
        byte[] image = photosService.getImage(photoReference, API_KEY);
        return image;

    }
}
