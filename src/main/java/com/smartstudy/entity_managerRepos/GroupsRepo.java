package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Groups;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class GroupsRepo extends BaseRepo<Groups> {
    public static Integer currentModuleId=0;

    public static Groups getGroupById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Groups.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
