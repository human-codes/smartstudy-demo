package com.smartstudy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@Entity
@NoArgsConstructor

public class Payment extends BaseEntity {
    private int amount=0;
    @CreationTimestamp
    @Column(updatable = false,insertable = true)
    private LocalDateTime paymentDate=LocalDateTime.now();

    @ManyToOne
    private Student student;

    public Payment(int amount, Student student) {
        this.amount = amount;
        this.student = student;
    }
}
