package entity;

/**
 * @author yezl
 * @date 2018/6/9 19:36
 * @decription this is :
 */
public class SellerItem {
    private User seller;
    private Item item;

    public SellerItem() {
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}
