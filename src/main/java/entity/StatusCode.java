package entity;

/**
 * @author yezl
 * @date 2018/5/31 21:57
 * @decription this is :
 */
public enum StatusCode {
    PASS(200,"成功"),REJECT(500,"登录失败"),REPEATED(501,"注册用户重复"),CONFIRMING(502,"用户审核中"),
    NOTEXIST(400,"不存在的用户"),NONEUERID(503, "学号没正确赋值");

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
