package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Modules;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class ModuleRepo {
    public static Integer currentCourseId=0;

    public static List<Modules> getModules() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Modules ", Modules.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public static Modules getModuleById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Modules.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
