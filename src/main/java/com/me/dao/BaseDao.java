package com.me.dao;

import java.io.Serializable;
import java.util.List;


public interface BaseDao<T> {
    public T load(Serializable id);

    public T get(Serializable id);
    
    public Serializable save(T t);
    
    public void update(T t);
    
    public void remove(T t);
    
    public List<T> findPage(int begin,int max);
     
    public List<T> findByExample(T example);
    
    public List<T> findAll();
    
    public int findCount();
}
