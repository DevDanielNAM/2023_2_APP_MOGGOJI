package com.example.moggojiserver.service;

import com.example.moggojiserver.model.Image;
import com.example.moggojiserver.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public long create(Image image){
        Image savedImg = imageRepository.save(image);
        return savedImg.getId();
    }

    public List<Image> viewAll() {
        return (List<Image>) imageRepository.findAll();
    }

    public Image viewById(long id) {
        return imageRepository.findById(id).get();
    }
}
