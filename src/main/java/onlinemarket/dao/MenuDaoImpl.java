package onlinemarket.dao;

import onlinemarket.model.MenuGroup;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import onlinemarket.model.Menu;

import java.util.List;

@Repository("menuDao")
public class MenuDaoImpl extends AbstractDao<Integer, Menu> implements MenuDao{

    @Override
    public List<Menu> listByMenuGroup(MenuGroup menuGroup) {

        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("menuGroup", menuGroup));
        criteria.add(Restrictions.isNull("menu"));
        criteria.addOrder(Order.asc("priority"));
        return criteria.list();
    }
}
