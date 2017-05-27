package com.project.pojo;

import java.util.ArrayList;
import java.util.List;

public class TbmaoyiExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbmaoyiExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCustomernameIsNull() {
            addCriterion("customerName is null");
            return (Criteria) this;
        }

        public Criteria andCustomernameIsNotNull() {
            addCriterion("customerName is not null");
            return (Criteria) this;
        }

        public Criteria andCustomernameEqualTo(String value) {
            addCriterion("customerName =", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotEqualTo(String value) {
            addCriterion("customerName <>", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThan(String value) {
            addCriterion("customerName >", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThanOrEqualTo(String value) {
            addCriterion("customerName >=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThan(String value) {
            addCriterion("customerName <", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThanOrEqualTo(String value) {
            addCriterion("customerName <=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLike(String value) {
            addCriterion("customerName like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotLike(String value) {
            addCriterion("customerName not like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameIn(List<String> values) {
            addCriterion("customerName in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotIn(List<String> values) {
            addCriterion("customerName not in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameBetween(String value1, String value2) {
            addCriterion("customerName between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotBetween(String value1, String value2) {
            addCriterion("customerName not between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andDatetimeIsNull() {
            addCriterion("dateTime is null");
            return (Criteria) this;
        }

        public Criteria andDatetimeIsNotNull() {
            addCriterion("dateTime is not null");
            return (Criteria) this;
        }

        public Criteria andDatetimeEqualTo(String value) {
            addCriterion("dateTime =", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeNotEqualTo(String value) {
            addCriterion("dateTime <>", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeGreaterThan(String value) {
            addCriterion("dateTime >", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeGreaterThanOrEqualTo(String value) {
            addCriterion("dateTime >=", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeLessThan(String value) {
            addCriterion("dateTime <", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeLessThanOrEqualTo(String value) {
            addCriterion("dateTime <=", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeLike(String value) {
            addCriterion("dateTime like", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeNotLike(String value) {
            addCriterion("dateTime not like", value, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeIn(List<String> values) {
            addCriterion("dateTime in", values, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeNotIn(List<String> values) {
            addCriterion("dateTime not in", values, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeBetween(String value1, String value2) {
            addCriterion("dateTime between", value1, value2, "datetime");
            return (Criteria) this;
        }

        public Criteria andDatetimeNotBetween(String value1, String value2) {
            addCriterion("dateTime not between", value1, value2, "datetime");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceIsNull() {
            addCriterion("buyTonprice is null");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceIsNotNull() {
            addCriterion("buyTonprice is not null");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceEqualTo(String value) {
            addCriterion("buyTonprice =", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceNotEqualTo(String value) {
            addCriterion("buyTonprice <>", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceGreaterThan(String value) {
            addCriterion("buyTonprice >", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceGreaterThanOrEqualTo(String value) {
            addCriterion("buyTonprice >=", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceLessThan(String value) {
            addCriterion("buyTonprice <", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceLessThanOrEqualTo(String value) {
            addCriterion("buyTonprice <=", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceLike(String value) {
            addCriterion("buyTonprice like", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceNotLike(String value) {
            addCriterion("buyTonprice not like", value, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceIn(List<String> values) {
            addCriterion("buyTonprice in", values, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceNotIn(List<String> values) {
            addCriterion("buyTonprice not in", values, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceBetween(String value1, String value2) {
            addCriterion("buyTonprice between", value1, value2, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBuytonpriceNotBetween(String value1, String value2) {
            addCriterion("buyTonprice not between", value1, value2, "buytonprice");
            return (Criteria) this;
        }

        public Criteria andBusinessnameIsNull() {
            addCriterion("businessName is null");
            return (Criteria) this;
        }

        public Criteria andBusinessnameIsNotNull() {
            addCriterion("businessName is not null");
            return (Criteria) this;
        }

        public Criteria andBusinessnameEqualTo(String value) {
            addCriterion("businessName =", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameNotEqualTo(String value) {
            addCriterion("businessName <>", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameGreaterThan(String value) {
            addCriterion("businessName >", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameGreaterThanOrEqualTo(String value) {
            addCriterion("businessName >=", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameLessThan(String value) {
            addCriterion("businessName <", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameLessThanOrEqualTo(String value) {
            addCriterion("businessName <=", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameLike(String value) {
            addCriterion("businessName like", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameNotLike(String value) {
            addCriterion("businessName not like", value, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameIn(List<String> values) {
            addCriterion("businessName in", values, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameNotIn(List<String> values) {
            addCriterion("businessName not in", values, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameBetween(String value1, String value2) {
            addCriterion("businessName between", value1, value2, "businessname");
            return (Criteria) this;
        }

        public Criteria andBusinessnameNotBetween(String value1, String value2) {
            addCriterion("businessName not between", value1, value2, "businessname");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceIsNull() {
            addCriterion("saleTonPrice is null");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceIsNotNull() {
            addCriterion("saleTonPrice is not null");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceEqualTo(String value) {
            addCriterion("saleTonPrice =", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceNotEqualTo(String value) {
            addCriterion("saleTonPrice <>", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceGreaterThan(String value) {
            addCriterion("saleTonPrice >", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceGreaterThanOrEqualTo(String value) {
            addCriterion("saleTonPrice >=", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceLessThan(String value) {
            addCriterion("saleTonPrice <", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceLessThanOrEqualTo(String value) {
            addCriterion("saleTonPrice <=", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceLike(String value) {
            addCriterion("saleTonPrice like", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceNotLike(String value) {
            addCriterion("saleTonPrice not like", value, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceIn(List<String> values) {
            addCriterion("saleTonPrice in", values, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceNotIn(List<String> values) {
            addCriterion("saleTonPrice not in", values, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceBetween(String value1, String value2) {
            addCriterion("saleTonPrice between", value1, value2, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andSaletonpriceNotBetween(String value1, String value2) {
            addCriterion("saleTonPrice not between", value1, value2, "saletonprice");
            return (Criteria) this;
        }

        public Criteria andCarnumIsNull() {
            addCriterion("carNum is null");
            return (Criteria) this;
        }

        public Criteria andCarnumIsNotNull() {
            addCriterion("carNum is not null");
            return (Criteria) this;
        }

        public Criteria andCarnumEqualTo(String value) {
            addCriterion("carNum =", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumNotEqualTo(String value) {
            addCriterion("carNum <>", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumGreaterThan(String value) {
            addCriterion("carNum >", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumGreaterThanOrEqualTo(String value) {
            addCriterion("carNum >=", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumLessThan(String value) {
            addCriterion("carNum <", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumLessThanOrEqualTo(String value) {
            addCriterion("carNum <=", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumLike(String value) {
            addCriterion("carNum like", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumNotLike(String value) {
            addCriterion("carNum not like", value, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumIn(List<String> values) {
            addCriterion("carNum in", values, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumNotIn(List<String> values) {
            addCriterion("carNum not in", values, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumBetween(String value1, String value2) {
            addCriterion("carNum between", value1, value2, "carnum");
            return (Criteria) this;
        }

        public Criteria andCarnumNotBetween(String value1, String value2) {
            addCriterion("carNum not between", value1, value2, "carnum");
            return (Criteria) this;
        }

        public Criteria andDistanceIsNull() {
            addCriterion("distance is null");
            return (Criteria) this;
        }

        public Criteria andDistanceIsNotNull() {
            addCriterion("distance is not null");
            return (Criteria) this;
        }

        public Criteria andDistanceEqualTo(String value) {
            addCriterion("distance =", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceNotEqualTo(String value) {
            addCriterion("distance <>", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceGreaterThan(String value) {
            addCriterion("distance >", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceGreaterThanOrEqualTo(String value) {
            addCriterion("distance >=", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceLessThan(String value) {
            addCriterion("distance <", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceLessThanOrEqualTo(String value) {
            addCriterion("distance <=", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceLike(String value) {
            addCriterion("distance like", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceNotLike(String value) {
            addCriterion("distance not like", value, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceIn(List<String> values) {
            addCriterion("distance in", values, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceNotIn(List<String> values) {
            addCriterion("distance not in", values, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceBetween(String value1, String value2) {
            addCriterion("distance between", value1, value2, "distance");
            return (Criteria) this;
        }

        public Criteria andDistanceNotBetween(String value1, String value2) {
            addCriterion("distance not between", value1, value2, "distance");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(String value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(String value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(String value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(String value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(String value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(String value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLike(String value) {
            addCriterion("price like", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotLike(String value) {
            addCriterion("price not like", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<String> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<String> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(String value1, String value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(String value1, String value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andFreightIsNull() {
            addCriterion("freight is null");
            return (Criteria) this;
        }

        public Criteria andFreightIsNotNull() {
            addCriterion("freight is not null");
            return (Criteria) this;
        }

        public Criteria andFreightEqualTo(String value) {
            addCriterion("freight =", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightNotEqualTo(String value) {
            addCriterion("freight <>", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightGreaterThan(String value) {
            addCriterion("freight >", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightGreaterThanOrEqualTo(String value) {
            addCriterion("freight >=", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightLessThan(String value) {
            addCriterion("freight <", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightLessThanOrEqualTo(String value) {
            addCriterion("freight <=", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightLike(String value) {
            addCriterion("freight like", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightNotLike(String value) {
            addCriterion("freight not like", value, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightIn(List<String> values) {
            addCriterion("freight in", values, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightNotIn(List<String> values) {
            addCriterion("freight not in", values, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightBetween(String value1, String value2) {
            addCriterion("freight between", value1, value2, "freight");
            return (Criteria) this;
        }

        public Criteria andFreightNotBetween(String value1, String value2) {
            addCriterion("freight not between", value1, value2, "freight");
            return (Criteria) this;
        }

        public Criteria andPutinamountIsNull() {
            addCriterion("putInAmount is null");
            return (Criteria) this;
        }

        public Criteria andPutinamountIsNotNull() {
            addCriterion("putInAmount is not null");
            return (Criteria) this;
        }

        public Criteria andPutinamountEqualTo(String value) {
            addCriterion("putInAmount =", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountNotEqualTo(String value) {
            addCriterion("putInAmount <>", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountGreaterThan(String value) {
            addCriterion("putInAmount >", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountGreaterThanOrEqualTo(String value) {
            addCriterion("putInAmount >=", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountLessThan(String value) {
            addCriterion("putInAmount <", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountLessThanOrEqualTo(String value) {
            addCriterion("putInAmount <=", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountLike(String value) {
            addCriterion("putInAmount like", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountNotLike(String value) {
            addCriterion("putInAmount not like", value, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountIn(List<String> values) {
            addCriterion("putInAmount in", values, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountNotIn(List<String> values) {
            addCriterion("putInAmount not in", values, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountBetween(String value1, String value2) {
            addCriterion("putInAmount between", value1, value2, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutinamountNotBetween(String value1, String value2) {
            addCriterion("putInAmount not between", value1, value2, "putinamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountIsNull() {
            addCriterion("putOutAmount is null");
            return (Criteria) this;
        }

        public Criteria andPutoutamountIsNotNull() {
            addCriterion("putOutAmount is not null");
            return (Criteria) this;
        }

        public Criteria andPutoutamountEqualTo(String value) {
            addCriterion("putOutAmount =", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountNotEqualTo(String value) {
            addCriterion("putOutAmount <>", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountGreaterThan(String value) {
            addCriterion("putOutAmount >", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountGreaterThanOrEqualTo(String value) {
            addCriterion("putOutAmount >=", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountLessThan(String value) {
            addCriterion("putOutAmount <", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountLessThanOrEqualTo(String value) {
            addCriterion("putOutAmount <=", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountLike(String value) {
            addCriterion("putOutAmount like", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountNotLike(String value) {
            addCriterion("putOutAmount not like", value, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountIn(List<String> values) {
            addCriterion("putOutAmount in", values, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountNotIn(List<String> values) {
            addCriterion("putOutAmount not in", values, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountBetween(String value1, String value2) {
            addCriterion("putOutAmount between", value1, value2, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andPutoutamountNotBetween(String value1, String value2) {
            addCriterion("putOutAmount not between", value1, value2, "putoutamount");
            return (Criteria) this;
        }

        public Criteria andEndamountIsNull() {
            addCriterion("endAmount is null");
            return (Criteria) this;
        }

        public Criteria andEndamountIsNotNull() {
            addCriterion("endAmount is not null");
            return (Criteria) this;
        }

        public Criteria andEndamountEqualTo(String value) {
            addCriterion("endAmount =", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountNotEqualTo(String value) {
            addCriterion("endAmount <>", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountGreaterThan(String value) {
            addCriterion("endAmount >", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountGreaterThanOrEqualTo(String value) {
            addCriterion("endAmount >=", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountLessThan(String value) {
            addCriterion("endAmount <", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountLessThanOrEqualTo(String value) {
            addCriterion("endAmount <=", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountLike(String value) {
            addCriterion("endAmount like", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountNotLike(String value) {
            addCriterion("endAmount not like", value, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountIn(List<String> values) {
            addCriterion("endAmount in", values, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountNotIn(List<String> values) {
            addCriterion("endAmount not in", values, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountBetween(String value1, String value2) {
            addCriterion("endAmount between", value1, value2, "endamount");
            return (Criteria) this;
        }

        public Criteria andEndamountNotBetween(String value1, String value2) {
            addCriterion("endAmount not between", value1, value2, "endamount");
            return (Criteria) this;
        }

        public Criteria andTotalbuyIsNull() {
            addCriterion("totalBuy is null");
            return (Criteria) this;
        }

        public Criteria andTotalbuyIsNotNull() {
            addCriterion("totalBuy is not null");
            return (Criteria) this;
        }

        public Criteria andTotalbuyEqualTo(String value) {
            addCriterion("totalBuy =", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyNotEqualTo(String value) {
            addCriterion("totalBuy <>", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyGreaterThan(String value) {
            addCriterion("totalBuy >", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyGreaterThanOrEqualTo(String value) {
            addCriterion("totalBuy >=", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyLessThan(String value) {
            addCriterion("totalBuy <", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyLessThanOrEqualTo(String value) {
            addCriterion("totalBuy <=", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyLike(String value) {
            addCriterion("totalBuy like", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyNotLike(String value) {
            addCriterion("totalBuy not like", value, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyIn(List<String> values) {
            addCriterion("totalBuy in", values, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyNotIn(List<String> values) {
            addCriterion("totalBuy not in", values, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyBetween(String value1, String value2) {
            addCriterion("totalBuy between", value1, value2, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalbuyNotBetween(String value1, String value2) {
            addCriterion("totalBuy not between", value1, value2, "totalbuy");
            return (Criteria) this;
        }

        public Criteria andTotalsaleIsNull() {
            addCriterion("totalSale is null");
            return (Criteria) this;
        }

        public Criteria andTotalsaleIsNotNull() {
            addCriterion("totalSale is not null");
            return (Criteria) this;
        }

        public Criteria andTotalsaleEqualTo(String value) {
            addCriterion("totalSale =", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleNotEqualTo(String value) {
            addCriterion("totalSale <>", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleGreaterThan(String value) {
            addCriterion("totalSale >", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleGreaterThanOrEqualTo(String value) {
            addCriterion("totalSale >=", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleLessThan(String value) {
            addCriterion("totalSale <", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleLessThanOrEqualTo(String value) {
            addCriterion("totalSale <=", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleLike(String value) {
            addCriterion("totalSale like", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleNotLike(String value) {
            addCriterion("totalSale not like", value, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleIn(List<String> values) {
            addCriterion("totalSale in", values, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleNotIn(List<String> values) {
            addCriterion("totalSale not in", values, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleBetween(String value1, String value2) {
            addCriterion("totalSale between", value1, value2, "totalsale");
            return (Criteria) this;
        }

        public Criteria andTotalsaleNotBetween(String value1, String value2) {
            addCriterion("totalSale not between", value1, value2, "totalsale");
            return (Criteria) this;
        }

        public Criteria andBackpaymentIsNull() {
            addCriterion("backPayment is null");
            return (Criteria) this;
        }

        public Criteria andBackpaymentIsNotNull() {
            addCriterion("backPayment is not null");
            return (Criteria) this;
        }

        public Criteria andBackpaymentEqualTo(String value) {
            addCriterion("backPayment =", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentNotEqualTo(String value) {
            addCriterion("backPayment <>", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentGreaterThan(String value) {
            addCriterion("backPayment >", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentGreaterThanOrEqualTo(String value) {
            addCriterion("backPayment >=", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentLessThan(String value) {
            addCriterion("backPayment <", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentLessThanOrEqualTo(String value) {
            addCriterion("backPayment <=", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentLike(String value) {
            addCriterion("backPayment like", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentNotLike(String value) {
            addCriterion("backPayment not like", value, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentIn(List<String> values) {
            addCriterion("backPayment in", values, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentNotIn(List<String> values) {
            addCriterion("backPayment not in", values, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentBetween(String value1, String value2) {
            addCriterion("backPayment between", value1, value2, "backpayment");
            return (Criteria) this;
        }

        public Criteria andBackpaymentNotBetween(String value1, String value2) {
            addCriterion("backPayment not between", value1, value2, "backpayment");
            return (Criteria) this;
        }

        public Criteria andSalesIsNull() {
            addCriterion("sales is null");
            return (Criteria) this;
        }

        public Criteria andSalesIsNotNull() {
            addCriterion("sales is not null");
            return (Criteria) this;
        }

        public Criteria andSalesEqualTo(String value) {
            addCriterion("sales =", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotEqualTo(String value) {
            addCriterion("sales <>", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesGreaterThan(String value) {
            addCriterion("sales >", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesGreaterThanOrEqualTo(String value) {
            addCriterion("sales >=", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesLessThan(String value) {
            addCriterion("sales <", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesLessThanOrEqualTo(String value) {
            addCriterion("sales <=", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesLike(String value) {
            addCriterion("sales like", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotLike(String value) {
            addCriterion("sales not like", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesIn(List<String> values) {
            addCriterion("sales in", values, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotIn(List<String> values) {
            addCriterion("sales not in", values, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesBetween(String value1, String value2) {
            addCriterion("sales between", value1, value2, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotBetween(String value1, String value2) {
            addCriterion("sales not between", value1, value2, "sales");
            return (Criteria) this;
        }

        public Criteria andCostIsNull() {
            addCriterion("cost is null");
            return (Criteria) this;
        }

        public Criteria andCostIsNotNull() {
            addCriterion("cost is not null");
            return (Criteria) this;
        }

        public Criteria andCostEqualTo(String value) {
            addCriterion("cost =", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotEqualTo(String value) {
            addCriterion("cost <>", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThan(String value) {
            addCriterion("cost >", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThanOrEqualTo(String value) {
            addCriterion("cost >=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThan(String value) {
            addCriterion("cost <", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThanOrEqualTo(String value) {
            addCriterion("cost <=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLike(String value) {
            addCriterion("cost like", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotLike(String value) {
            addCriterion("cost not like", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostIn(List<String> values) {
            addCriterion("cost in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotIn(List<String> values) {
            addCriterion("cost not in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostBetween(String value1, String value2) {
            addCriterion("cost between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotBetween(String value1, String value2) {
            addCriterion("cost not between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andProfitIsNull() {
            addCriterion("profit is null");
            return (Criteria) this;
        }

        public Criteria andProfitIsNotNull() {
            addCriterion("profit is not null");
            return (Criteria) this;
        }

        public Criteria andProfitEqualTo(String value) {
            addCriterion("profit =", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotEqualTo(String value) {
            addCriterion("profit <>", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitGreaterThan(String value) {
            addCriterion("profit >", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitGreaterThanOrEqualTo(String value) {
            addCriterion("profit >=", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitLessThan(String value) {
            addCriterion("profit <", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitLessThanOrEqualTo(String value) {
            addCriterion("profit <=", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitLike(String value) {
            addCriterion("profit like", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotLike(String value) {
            addCriterion("profit not like", value, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitIn(List<String> values) {
            addCriterion("profit in", values, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotIn(List<String> values) {
            addCriterion("profit not in", values, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitBetween(String value1, String value2) {
            addCriterion("profit between", value1, value2, "profit");
            return (Criteria) this;
        }

        public Criteria andProfitNotBetween(String value1, String value2) {
            addCriterion("profit not between", value1, value2, "profit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitIsNull() {
            addCriterion("totalProfit is null");
            return (Criteria) this;
        }

        public Criteria andTotalprofitIsNotNull() {
            addCriterion("totalProfit is not null");
            return (Criteria) this;
        }

        public Criteria andTotalprofitEqualTo(String value) {
            addCriterion("totalProfit =", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitNotEqualTo(String value) {
            addCriterion("totalProfit <>", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitGreaterThan(String value) {
            addCriterion("totalProfit >", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitGreaterThanOrEqualTo(String value) {
            addCriterion("totalProfit >=", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitLessThan(String value) {
            addCriterion("totalProfit <", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitLessThanOrEqualTo(String value) {
            addCriterion("totalProfit <=", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitLike(String value) {
            addCriterion("totalProfit like", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitNotLike(String value) {
            addCriterion("totalProfit not like", value, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitIn(List<String> values) {
            addCriterion("totalProfit in", values, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitNotIn(List<String> values) {
            addCriterion("totalProfit not in", values, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitBetween(String value1, String value2) {
            addCriterion("totalProfit between", value1, value2, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andTotalprofitNotBetween(String value1, String value2) {
            addCriterion("totalProfit not between", value1, value2, "totalprofit");
            return (Criteria) this;
        }

        public Criteria andUpdatedIsNull() {
            addCriterion("updated is null");
            return (Criteria) this;
        }

        public Criteria andUpdatedIsNotNull() {
            addCriterion("updated is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatedEqualTo(String value) {
            addCriterion("updated =", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotEqualTo(String value) {
            addCriterion("updated <>", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedGreaterThan(String value) {
            addCriterion("updated >", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedGreaterThanOrEqualTo(String value) {
            addCriterion("updated >=", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedLessThan(String value) {
            addCriterion("updated <", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedLessThanOrEqualTo(String value) {
            addCriterion("updated <=", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedLike(String value) {
            addCriterion("updated like", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotLike(String value) {
            addCriterion("updated not like", value, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedIn(List<String> values) {
            addCriterion("updated in", values, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotIn(List<String> values) {
            addCriterion("updated not in", values, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedBetween(String value1, String value2) {
            addCriterion("updated between", value1, value2, "updated");
            return (Criteria) this;
        }

        public Criteria andUpdatedNotBetween(String value1, String value2) {
            addCriterion("updated not between", value1, value2, "updated");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNull() {
            addCriterion("created is null");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNotNull() {
            addCriterion("created is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedEqualTo(String value) {
            addCriterion("created =", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotEqualTo(String value) {
            addCriterion("created <>", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThan(String value) {
            addCriterion("created >", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThanOrEqualTo(String value) {
            addCriterion("created >=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThan(String value) {
            addCriterion("created <", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThanOrEqualTo(String value) {
            addCriterion("created <=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLike(String value) {
            addCriterion("created like", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotLike(String value) {
            addCriterion("created not like", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedIn(List<String> values) {
            addCriterion("created in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotIn(List<String> values) {
            addCriterion("created not in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedBetween(String value1, String value2) {
            addCriterion("created between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotBetween(String value1, String value2) {
            addCriterion("created not between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andExtend1IsNull() {
            addCriterion("extend1 is null");
            return (Criteria) this;
        }

        public Criteria andExtend1IsNotNull() {
            addCriterion("extend1 is not null");
            return (Criteria) this;
        }

        public Criteria andExtend1EqualTo(String value) {
            addCriterion("extend1 =", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1NotEqualTo(String value) {
            addCriterion("extend1 <>", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1GreaterThan(String value) {
            addCriterion("extend1 >", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1GreaterThanOrEqualTo(String value) {
            addCriterion("extend1 >=", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1LessThan(String value) {
            addCriterion("extend1 <", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1LessThanOrEqualTo(String value) {
            addCriterion("extend1 <=", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1Like(String value) {
            addCriterion("extend1 like", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1NotLike(String value) {
            addCriterion("extend1 not like", value, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1In(List<String> values) {
            addCriterion("extend1 in", values, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1NotIn(List<String> values) {
            addCriterion("extend1 not in", values, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1Between(String value1, String value2) {
            addCriterion("extend1 between", value1, value2, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend1NotBetween(String value1, String value2) {
            addCriterion("extend1 not between", value1, value2, "extend1");
            return (Criteria) this;
        }

        public Criteria andExtend2IsNull() {
            addCriterion("extend2 is null");
            return (Criteria) this;
        }

        public Criteria andExtend2IsNotNull() {
            addCriterion("extend2 is not null");
            return (Criteria) this;
        }

        public Criteria andExtend2EqualTo(String value) {
            addCriterion("extend2 =", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2NotEqualTo(String value) {
            addCriterion("extend2 <>", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2GreaterThan(String value) {
            addCriterion("extend2 >", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2GreaterThanOrEqualTo(String value) {
            addCriterion("extend2 >=", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2LessThan(String value) {
            addCriterion("extend2 <", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2LessThanOrEqualTo(String value) {
            addCriterion("extend2 <=", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2Like(String value) {
            addCriterion("extend2 like", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2NotLike(String value) {
            addCriterion("extend2 not like", value, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2In(List<String> values) {
            addCriterion("extend2 in", values, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2NotIn(List<String> values) {
            addCriterion("extend2 not in", values, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2Between(String value1, String value2) {
            addCriterion("extend2 between", value1, value2, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend2NotBetween(String value1, String value2) {
            addCriterion("extend2 not between", value1, value2, "extend2");
            return (Criteria) this;
        }

        public Criteria andExtend3IsNull() {
            addCriterion("extend3 is null");
            return (Criteria) this;
        }

        public Criteria andExtend3IsNotNull() {
            addCriterion("extend3 is not null");
            return (Criteria) this;
        }

        public Criteria andExtend3EqualTo(String value) {
            addCriterion("extend3 =", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3NotEqualTo(String value) {
            addCriterion("extend3 <>", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3GreaterThan(String value) {
            addCriterion("extend3 >", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3GreaterThanOrEqualTo(String value) {
            addCriterion("extend3 >=", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3LessThan(String value) {
            addCriterion("extend3 <", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3LessThanOrEqualTo(String value) {
            addCriterion("extend3 <=", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3Like(String value) {
            addCriterion("extend3 like", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3NotLike(String value) {
            addCriterion("extend3 not like", value, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3In(List<String> values) {
            addCriterion("extend3 in", values, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3NotIn(List<String> values) {
            addCriterion("extend3 not in", values, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3Between(String value1, String value2) {
            addCriterion("extend3 between", value1, value2, "extend3");
            return (Criteria) this;
        }

        public Criteria andExtend3NotBetween(String value1, String value2) {
            addCriterion("extend3 not between", value1, value2, "extend3");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}