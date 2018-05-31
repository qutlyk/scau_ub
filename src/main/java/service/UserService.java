package service;

import entity.StatusCode;
import entity.User;

/**
 * @author yezl
 * @date 2018/5/30 0:03
 * @decription this is :
 */
public interface UserService {
    public StatusCode login(User user);
    public StatusCode register(User user);

}
