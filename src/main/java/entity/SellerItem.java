package entity;

/**
 * @author yezl
 * @date 2018/6/4 22:59
 * @decription this is :
 */
public class SellerItem {

    private Item item;
    private User seller;

    public SellerItem() {
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }
}
