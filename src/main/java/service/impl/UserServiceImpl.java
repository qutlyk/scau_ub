package service.impl;

import dao.UserMapper;
import entity.User;
import entity.UserExample;
import model.StatusCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

/**
 * @author yezl
 * @date 2018/5/30 0:04
 * @decription this is :
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    public List<User> login(User user) {
        UserExample ue = new UserExample();
        UserExample.Criteria uec = ue.createCriteria();
        uec.andUseridEqualTo(user.getUserid());
        List<User> users = userMapper.selectByExample(ue);
        return users;
    }

    public StatusCode register(User user) {
        UserExample ue = new UserExample();
        UserExample.Criteria uec = ue.createCriteria();
        if (user.getUserid() != null)
            uec.andUseridEqualTo(user.getUserid());
        else
            return StatusCode.NONEUERID;
        List<User> users = userMapper.selectByExample(ue);
        if (users.size() > 0) {
            return StatusCode.REPEATED;
        } else {
            userMapper.insert(user);
        }
        return StatusCode.PASS;
    }

    public StatusCode updateUser(User user) {
        UserExample ue = new UserExample();
        UserExample.Criteria uec = ue.createCriteria();
        if (user.getUserid() != null)
            uec.andUseridEqualTo(user.getUserid());
        else
            return StatusCode.NONEUERID;
        List<User> users = userMapper.selectByExample(ue);

        if (users.size() > 0) {
            for (User u : users) {
                user.setPassword(u.getPassword());
                user.setMoney(u.getMoney());
            }
            userMapper.updateByPrimaryKey(user);
            return StatusCode.PASS;

        } else {
            return StatusCode.NONEUERID;
        }

    }

    public User getUser(long userid){
        return userMapper.selectByPrimaryKey(userid);
    }


}
