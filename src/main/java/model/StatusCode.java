package model;

/**
 * @author yezl
 * @date 2018/5/31 21:57
 * @decription this is :
 */
public enum StatusCode {
    PASS(200,"成功"),REJECT(500,"登录失败"),REPEATED(501,"注册用户重复"),CONFIRMING(502,"用户审核中"),
    NOTEXIST(400,"不存在的用户"),NONEUERID(503, "学号没正确赋值"),SAME_BOOK(504,"失败，你已经上架该书籍"),
    SAME_SHOPCART(505,"添加失败，你已收藏过该书籍"),HAS_BUY(506,"失败，无法购买，该书籍可能已被人抢先购买或者下架了"),
    BUY_SEIFITEM(507,"购买失败，不允许购买自己售卖上架的书籍"),MONEY_NOT_ENOUGH(508,"购买失败，你的资金不足"),
    CANNOT_DELETE(509,"无法删除，商品可能被锁定"),CANNOT_CONFIRM(510,"无法确认收货，你没有该权限"),
    CANNOT_CONFIRM2(511,"无法确认收货，数据出错，系统发现入侵");

    private int state;

    private String stateInfo;

    private StatusCode(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

}
