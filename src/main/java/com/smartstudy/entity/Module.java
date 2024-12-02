package com.smartstudy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor

public class Module {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String module_name;
    @ManyToOne
    private Course course;

    private Boolean isActive = false;

    public Module(String name, Course courseId) {
        this.module_name = name;
        this.course = courseId;
    }

}

