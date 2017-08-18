package com.zhiyou100.ssm.mapper;

import com.zhiyou100.ssm.model.User;
import com.zhiyou100.ssm.model.UserExample;
import com.zhiyou100.ssm.model.UserVO;
import com.zhiyou100.ssm.util.Page;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer uId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> getPage(UserVO vo);

	Integer getTotalCount(UserVO vo);
  /*  List<User> getPage(String userKeyWord, String userSearchField,Integer a);

	Integer getTotalCount(String userKeyWord, String userSearchField);
*/
    
}