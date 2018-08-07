package onlinemarket.controller.frontend;

import onlinemarket.controller.MainController;
import onlinemarket.form.filter.FilterForm;
import onlinemarket.model.Brand;
import onlinemarket.model.ProductCategory;
import onlinemarket.service.BrandService;
import onlinemarket.service.ProductCategoryService;
import onlinemarket.service.ProductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

public class FrGeneralGroup extends MainController {

    @Autowired
    ProductService productService;

    @Autowired
    ProductCategoryService productCategoryService;

    @Autowired
    BrandService brandService;

    protected FilterForm filterForm;

    protected ProductCategory productCategory;

    protected Brand brand;

    protected String template = "frontend/product-category";

    protected String brandPath;

    protected String productPath;

    protected String title;

    protected String subTitle;

    protected String relativePath;

    @ModelAttribute
    public ModelMap populateAttribute(ModelMap model) {
        filterForm = new FilterForm();

        FilterForm filterFormTopList = new FilterForm();
        filterFormTopList.getGroupSearch().put("state", "0");
        filterFormTopList.setSize(5);
        filterFormTopList.setOrder("desc");
        filterFormTopList.setOrderBy("numberOrder");
        model.put("productBestSellerList", productService.convertProductToFrProduct(productService.list(filterFormTopList).getList()));

        filterFormTopList.setOrderBy("productViewsStatistic.total");
        model.put("productBestViewing", productService.convertProductToFrProduct(productService.list(filterFormTopList).getList()));

        filterFormTopList.setOrderBy("ratingStatistic.totalScore");
        model.put("productBestRating",productService.convertProductToFrProduct(productService.list(filterFormTopList).getList()));

        filterForm.getGroupSearch().put("state", "0");
        filterForm.setOrderBy("releaseDate");
        filterForm.setOrder("desc");

        generateBreadcrumbs();

        return model;
    }


    protected String generateGeneral(@ModelAttribute("filterForm") FilterForm filterForm, ModelMap modelMap) {
        String orderBy = filterForm.getGroupSearch().get("orderBy");
        if(StringUtils.isNotBlank(orderBy)){
            String arrayOrderBy[] = orderBy.split("\\.");
            if(arrayOrderBy.length == 2){
                filterForm.setOrderBy(arrayOrderBy[0]);
                filterForm.setOrder(StringUtils.equalsIgnoreCase(arrayOrderBy[1], "asc") ? "asc" : "desc");
            }
            if(arrayOrderBy.length == 3){
                filterForm.setOrderBy(arrayOrderBy[0]+"."+arrayOrderBy[1]);
                filterForm.setOrder(StringUtils.equalsIgnoreCase(arrayOrderBy[1], "asc") ? "asc" : "desc");
            }
        }


        modelMap.put("result", productService.frontendProductResultObject( productService.list(filterForm)));
        modelMap.put("productCategory", productCategory);
        modelMap.put("brand", brand);
        modelMap.put("brandPath", brandPath);
        modelMap.put("productPath", productPath);
        modelMap.put("relativePath", relativePath);

        modelMap.put("title", title);
        modelMap.put("subTitle", subTitle);
        modelMap.put("filterForm", filterForm);

        return template;
    }
}
