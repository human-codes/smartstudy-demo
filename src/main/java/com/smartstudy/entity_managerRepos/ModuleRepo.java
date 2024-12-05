package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Modules;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class ModuleRepo extends BaseRepo<Modules> {
    public static Integer currentCourseId=0;

    public static Modules getModuleById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Modules.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
