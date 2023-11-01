package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface InstMapper {
    @Select("SELECT * FROM instructor")
    public List<Instructor> getInstructorList();
    @Select("SELECT * FROM instructor WHERE id = #{id}")
    public Instructor getInstructor(String id);
    @Select("SELECT * FROM instructor WHERE no = #{no}")
    public Instructor getInstructorName(int no);
    @Insert("INSERT INTO instructor VALUES (default, #{id}, #{pw}, #{name}, #{tel}, #{email})")
    @Options(useGeneratedKeys=true, keyProperty="no")
    public void addInstructor(Instructor instructor);
    @Update("UPDATE instructor SET cate = #{cate}, pname = #{pname}, pcomment = #{pcomment}, plist = #{plist}, price = #{price}, imgsrc1 = #{imgSrc1}, resdate = #{resdate} WHERE no = #{no}")
    public void updateInstructor(Instructor instructor);
    @Delete("DELETE FROM instructor WHERE no = #{no}")
    public void delInstructor(int no);
    @Select("select id, pw, name from instructor where id = #{id}")
    public Instructor loginCheck(String id);

}
