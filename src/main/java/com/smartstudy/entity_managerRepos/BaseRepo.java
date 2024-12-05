package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Modules;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import lombok.val;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Queue;

import static com.smartstudy.MyListener.EMF;

public class BaseRepo<T> {

    private final Class<T> persistentClass;

    public BaseRepo() {
        Class<T> entityClass = (Class<T>)((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistentClass = entityClass;
    }

    public void save(T t) {
        try (EntityManager entityManager = EMF.createEntityManager()){
            entityManager.getTransaction().begin();
            entityManager.persist(t);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<T> findAll(int page,String search) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            page--;
            return entityManager.createQuery("from %s t where t. ".formatted(persistentClass.getSimpleName()), persistentClass)
                    .setFirstResult(page*10)
                    .setMaxResults(10)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
