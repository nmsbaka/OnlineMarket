package onlinemarket.service;

import java.util.List;

import onlinemarket.dao.EventDao;
import onlinemarket.dao.ProductDao;
import onlinemarket.util.Slugify;
import onlinemarket.util.exception.CustomException;
import onlinemarket.util.exception.brand.BrandHasEventException;
import onlinemarket.util.exception.brand.BrandHasProductException;
import onlinemarket.util.exception.brand.BrandNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import onlinemarket.dao.BrandDao;
import onlinemarket.form.filter.FilterForm;
import onlinemarket.model.Brand;
import onlinemarket.model.Event;
import onlinemarket.result.ResultObject;

@Service("brandService")
@Transactional
public class BrandServiceImpl implements BrandService{

	@Autowired
	BrandDao brandDao;

	@Autowired
	EventDao eventDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	Slugify slugify;

	@Override
	public void save(Brand entity) {
		slugify.slugify(entity.getSlug());
		brandDao.save(entity);
	}

	@Override
	public void delete(Integer id) throws BrandNotFoundException, BrandHasEventException, BrandHasProductException {
		Brand brand = brandDao.getByKey(id);
		if(brand == null) throw new BrandNotFoundException();
		if(eventDao.getUniqueResultBy("brand", brand) != null) throw new BrandHasEventException();
		if(productDao.getByDeclaration("brand", brand) != null) throw new BrandHasProductException();
		brandDao.delete(brand);

	}

	@Override
	public void update(Brand entity) throws BrandNotFoundException {
		if(brandDao.getByKey(entity.getId()) == null) throw new BrandNotFoundException();
		slugify.slugify(entity.getSlug());
		brandDao.update(entity);
	}

	@Override
	public Brand getByKey(Integer key) {
		return brandDao.getByKey(key);
	}

	@Override
	public Brand getByDeclaration(String key, Object value) {
		return brandDao.getByDeclaration(key, value);
	}


	@Override
	public ResultObject<Brand> list(FilterForm filterForm) {
		return brandDao.list(filterForm);
	}

	@Override
	public List<Brand> list() {
		return brandDao.list();
	}


}
