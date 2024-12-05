package com.smartstudy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class Student extends BaseEntity {

    private String name;

    @ManyToOne
    private Groups groups;

    public Student(String name, Groups groups) {
        this.name = name;
        this.groups = groups;
    }
}
