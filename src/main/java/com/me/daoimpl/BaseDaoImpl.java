package com.me.daoimpl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.me.dao.BaseDao;


public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	private Class<T> clazz;
	
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	public BaseDaoImpl(Class<T> clazz) {
		this.clazz=clazz;
	}

	@Override
	public T load(Serializable id) {
		return this.hibernateTemplate.load(clazz, id);
	}

	@Override
	public T get(Serializable id) {
		return this.hibernateTemplate.get(clazz, id);
	}

	@Override
	public Serializable save(T t) {
		return this.hibernateTemplate.save(t);
	}

	@Override
	public void update(T t) {
		this.hibernateTemplate.update(t);
	}

	@Override
	public void remove(T t) {
		this.hibernateTemplate.delete(t);
	}

	@Override
	public List<T> findPage(int begin, int max) {
		DetachedCriteria dCriteria=DetachedCriteria.forClass(clazz);
		return (List<T>) this.hibernateTemplate.findByCriteria(dCriteria, begin, max);
		
	}

	@Override
	public List<T> findByExample(T example) {
		return this.hibernateTemplate.findByExample(example);
	}

	@Override
	public List<T> findAll() {
		DetachedCriteria dCriteria=DetachedCriteria.forClass(clazz);
		return (List<T>) this.hibernateTemplate.findByCriteria(dCriteria);
	}

    public int findCount() {
    	String sql="select count(*) from "+clazz.getSimpleName()+" as "+clazz.getSimpleName().toLowerCase();
    	Long str=(Long) hibernateTemplate.find(sql).listIterator().next();
    	String str1=String.valueOf(str);
    	return Integer.parseInt(str1);
    };
	
}
