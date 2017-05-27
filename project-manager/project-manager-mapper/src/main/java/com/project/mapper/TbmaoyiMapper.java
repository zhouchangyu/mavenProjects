package com.project.mapper;

import com.project.pojo.Tbmaoyi;
import com.project.pojo.TbmaoyiExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbmaoyiMapper {
    int countByExample(TbmaoyiExample example);

    int deleteByExample(TbmaoyiExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Tbmaoyi record);

    int insertSelective(Tbmaoyi record);

    List<Tbmaoyi> selectByExample(TbmaoyiExample example);

    Tbmaoyi selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Tbmaoyi record, @Param("example") TbmaoyiExample example);

    int updateByExample(@Param("record") Tbmaoyi record, @Param("example") TbmaoyiExample example);

    int updateByPrimaryKeySelective(Tbmaoyi record);

    int updateByPrimaryKey(Tbmaoyi record);
}