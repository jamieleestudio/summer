package com.summer.framework.orm.domain;


import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Abstract base class for entities. Allows parameterization of id type, chooses auto-generation and implements
 */
@MappedSuperclass
public abstract class AbstractPersistable<PK extends Serializable> implements Persistable<PK> {

    private static final long serialVersionUID = -5554308939380869754L;

    @Id
    @GeneratedValue
    private PK id;


    @Override
    public PK getId() {
        return id;
    }

    public void setId(PK id) {
        this.id = id;
    }
}
