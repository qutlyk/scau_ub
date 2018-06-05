package service;

import entity.User;
import model.StatusCode;

import java.util.List;

/**
 * @author yezl
 * @date 2018/5/30 0:03
 * @decription this is :
 */
public interface UserService {
    public List<User> login(User user);
    public StatusCode register(User user);
    public StatusCode updateUser(User user);
    public User getUser(long userid);
}
