package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Faq;

@Mapper
public interface FaqRepository {

	@Select("""
			SELECT COUNT(*)
			FROM faq
			WHERE  `name` = #{name} AND title LIKE CONCAT('%', #{searchKeyword}, '%');
			""")
	public int getFaqsCount(String searchKeyword, String name);

	@Select("""
			<script>
				SELECT * 
				FROM faq
				WHERE 1
				<if test="searchKeyword != ''"> 
				 AND `name` = #{name}
				</if>
			</script>	
			""")
	public List<Faq> getForPrintFaqs(String searchKeyword, String name);



}
