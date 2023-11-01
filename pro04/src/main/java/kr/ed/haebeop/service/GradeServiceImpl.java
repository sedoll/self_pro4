package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Grade;
import kr.ed.haebeop.repository.GradeRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService{
    @Autowired
    private GradeRepositoryImpl gradeRepository;

    @Override
    public List<Grade> gradeList() throws Exception {
        return gradeRepository.gradeList();
    }

    @Override
    public Grade gradeDetail(int no) throws Exception {
        return gradeRepository.gradeDetail(no);
    }

    @Override
    public void gradeInsert(Grade grade) throws Exception {
        gradeRepository.gradeInsert(grade);
    }

    @Override
    public void gradeDelete(int no) throws Exception {
        gradeRepository.gradeDelete(no);
    }

    @Override
    public void gradeEdit(Grade grade) throws Exception {
        gradeRepository.gradeEdit(grade);
    }

    @Override
    public void totGrade(String sname) throws Exception {
        gradeRepository.totGrade(sname);
    }

    @Override
    public void avgGrade(String sname) throws Exception {
        gradeRepository.avgGrade(sname);
    }
}
