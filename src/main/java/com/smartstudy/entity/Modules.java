package com.smartstudy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor

public class Modules extends BaseEntity {

    private String module_name;
    @ManyToOne
    private Course course;

    private Boolean isActive = true;

    public Modules(String name, Course courseId) {
        this.module_name = name;
        this.course = courseId;
    }

}

