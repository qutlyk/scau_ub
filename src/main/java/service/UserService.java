package service;

import entity.StatusCode;
import entity.User;

import java.util.List;

/**
 * @author yezl
 * @date 2018/5/30 0:03
 * @decription this is :
 */
public interface UserService {
    public List<User> login(User user);
    public StatusCode register(User user);

}
