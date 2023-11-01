package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.LecFile;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface LectureMapper {
    @Select("SELECT * FROM lecture")
    public List<Lecture> getLectureList();
    @Select("SELECT * FROM lecture WHERE no = #{no}")
    public Lecture getLecture(int no);
    @Insert("INSERT INTO lecture VALUES (default, #{cate}, #{slevel}, #{title}, #{content}, #{simg}, #{sfile1}, #{sfile2}, #{sfile3}, #{sfile4}, #{sfile5}, #{price}, #{ino}, default, default, #{lec_max}, #{aplctClss1}, #{aplctClss2}, #{studyStart}, #{studyEnd}, #{endDay})")
    @Options(useGeneratedKeys=true, keyProperty="no")
    public void addLecture(Lecture lec);
    @Update("UPDATE lecture SET cate=#{cate}, slevel=#{slevel}, title=#{title}, content=#{content}, simg=#{simg}, sfile1=#{sfile1}, sfile2=#{sfile2}, sfile3=#{sfile3}, sfile4=#{sfile4}, sfile5=#{sfile5}, ino=#{ino} WHERE no=#{no}")
    public void updateLecture(Lecture lec);
    @Delete("DELETE FROM lecture WHERE no = #{no}")
    public void delLecture(int no);
    @Select("SELECT * FROM lecture ORDER BY price DESC")
    public List<Lecture> getLectureListBest();
    @Select("SELECT * FROM lecture ORDER BY resdate DESC")
    public List<Lecture> getLectureListNew();
    @Update("update lecture set cnt=cnt+1 where no=#{no}")
    public void countUp(int no);

    // 수강인원 +1
    @Update("update lecture set lec=lec+1 where no=#{no}")
    public void countUpLec(int no);

    // 수강인원 -1
    @Update("update lecture set lec=lec-1 where no=#{no}")
    public void countDownLec(int no);
    
    // 실제 파일 이름 저장
    @Insert("insert into lecfile values(default, #{sfile}, #{realName})")
    public void setLecFile(LecFile lecFile);
    
    // 실제 파일 이름 수정
    @Update("update lecfile set sfile=#{sfile}, realname=#{realName} where no=#{no}")
    public void updateLecFile(LecFile lecFile);
    
    // 기존 파일의 no 출력
    @Select("select no from lecfile where sfile=#{sfile}")
    public int selectLecFile(String sfile);
    
    // 기존 파일 이름 추출
    @Select("select realname from lecfile where sfile=#{sfile}")
    public String getLecFileName(String sfile);
}
