package com.smartstudy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor

public class Groups extends BaseEntity {

    private String group_name;

    @ManyToOne
    private Modules modules;

    public Groups(String group_name, Modules modules) {
        this.group_name = group_name;
        this.modules = modules;
    }
}
