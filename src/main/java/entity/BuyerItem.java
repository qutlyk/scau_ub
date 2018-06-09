package entity;

/**
 * @author yezl
 * @date 2018/6/9 19:35
 * @decription this is :
 */
public class BuyerItem {
    private User buyer;
    private Item item;

    public BuyerItem() {
    }

    public BuyerItem(User buyer, Item item) {
        this.buyer = buyer;
        this.item = item;
    }

    public User getBuyer() {
        return buyer;
    }

    public void setBuyer(User buyer) {
        this.buyer = buyer;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}
