package onlinemarket.service;

import onlinemarket.dao.ProductViewsDao;
import onlinemarket.dao.ProductViewsStatisticDao;
import onlinemarket.model.Product;
import onlinemarket.model.ProductViews;
import onlinemarket.model.ProductViewsStatistic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

@Service("productViewsService")
public class ProductViewsServiceImpl implements ProductViewsService{

    @Autowired
    ProductViewsDao productViewsDao;

    @Autowired
    ProductViewsStatisticDao productViewsStatisticDao;

    @Override
    public ProductViews getByProductInCurrentDay(Product product) {
        return productViewsDao.getByProductInCurrentDay(product);
    }

    @Override
    public void save(Product product) {

        ProductViews productViews = productViewsDao.getByProductInCurrentDay(product);
        if(productViews == null) productViews = new ProductViews();
        productViews.setCount(productViews.getCount()+1);

        ProductViewsStatistic productViewsStatistic = productViewsStatisticDao.getByDeclaration("product", product);
        if(productViewsStatistic == null) productViewsStatistic = new ProductViewsStatistic();

        Calendar calendar = Calendar.getInstance();

        productViewsStatistic.setTotal(productViewsStatistic.getTotal()+1);
        productViewsStatistic.setMonth(productViewsStatistic.getMonth()+1);
        productViewsStatistic.setWeek(productViewsStatistic.getWeek()+1);
        productViewsStatistic.setYear(productViewsStatistic.getYear()+1);

        productViewsDao.update(productViews);
    }

}
