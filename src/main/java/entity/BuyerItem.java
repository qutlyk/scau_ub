package entity;

/**
 * @author yezl
 * @date 2018/6/4 22:59
 * @decription this is :
 */
public class BuyerItem {

    private Item item;
    private User buyer;

    public BuyerItem() {
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public User getBuyer() {
        return buyer;
    }

    public void setBuyer(User buyer) {
        this.buyer = buyer;
    }
}
