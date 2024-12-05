package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Payment;
import com.smartstudy.entity.Student;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class PaymentsRepo extends BaseRepo<Payment> {
    public static Integer currentStudentId=0;

    public static Payment getPaymentById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Payment.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
